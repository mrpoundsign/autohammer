import { fmod } from "../fmod";
import { World, WorldInfo } from "../world";
import { Realm } from "../realm";
import { reloadable } from "../reload";
import { Scene } from "./scene";
import { InventoryUI } from "../ui/inventory";
import { ContainerUI } from "../ui/container";
import { CraftUI } from "../ui/craft";
import { HudUI } from "../ui/hud";
import { CraftManager } from "../systems/craft";
import { CombustSystem } from "../systems/combust";
import { Camera } from "../camera";
import { InteractionSystem } from "../systems/interaction";
import { architect } from "../architect";
import { Sizes } from "../Sizes";
import { ApotheosUi } from "../ui/apotheos";
import { InputSystem } from "../systems/input";
import { CombatSystem } from "../systems/combat";
import { Tweening } from "../systems/tween";
import { core } from "../core";
import { scheduler } from "../systems/scheduler";
import { BypassSystem } from "../systems/bypass";
import { PorterSystem } from "../systems/porter";
import { DrillSystem } from "../systems/drill";
import { LayerTypes } from "../components/location";
import { FacingDirection } from "../direction";
import { ItemSystem } from "../systems/item";
import { ModalUi } from "../ui/modal";
import { TooltipUi } from "../ui/tooltip";
import { FabricatorSystem } from "../systems/fabricator";
import { CrafterSystem } from "../systems/crafter";
import { FarmingSystem } from "../systems/farming";
import { TechnologyManager } from "../systems/technology";
import { ResearchSystem } from "../systems/research";
import { LootSystem } from "../systems/loot";
import { ViewUI } from "../ui/base";
import { DispenserSystem } from "../systems/dispenser";
import { HusbandrySystem } from "../systems/husbandry";
import { SettingsUI } from "../ui/settings_ingame";
import { ResearchHudUI } from "../ui/research";
import { NotificationSystem } from "../systems/notification";
import { OldTutorialSystem, TutorialSystem } from "../systems/tutorial";
import { WellspringSystem } from "../systems/wellspring";
import { InputStateTypes } from "../components/input";
import { StorageTankUi } from "../ui/storage_tank";
import { worldgen } from "../systems/worldgen";
import { ConduitSystem } from "../systems/conduit";
import { MainframeUI } from "../ui/mainframe";
import { ModularUI, registerModularLayouts } from "../ui/modular";
import { Event, GameEvents } from "../event";
import { AncientCommsUI } from "../ui/ancient_comms";
import { EndingUI } from "../ui/ending";
import { GAME_VERSION, GameVersion } from "../version";
import { UpgradeType } from "../upgrades";
import { settingkeys } from "../ui/settings";

declare var _G: any;
const DEBUGGING: boolean = settings.getBool(settingkeys.DEBUGGING_MODE_ENABLED);

class EntityPlacer {
    prefab: Entity;
    color: Color;
    positions: Array<TileVector> = [];
    callback?: (entity: Entity) => void;

    constructor(prefabKey: string, color: Color, callback?: (entity: Entity) => void) {
        this.prefab = Prefab.get(prefabKey);
        this.color = color;
        this.callback = callback;
    }

    addTo(realm: Realm, rules: LuaTable) {
        const soilID = Prefab.get("tile.soil").tile.id;
        const map = realm.backwall.map;
        rules.set(this.color.uid, (position: TileVector) => {
            this.positions.push(position.copy());
            if (!map.isEmpty(new TileVector(position.x, position.y - 1))) {
                map.set(position, soilID, 1);
            }
        });
    }

    place(realm: Realm) {
        for (const position of this.positions) {
            let entity = architect.calculateCreatePlacement(realm.id, this.prefab, position.asVector(), FacingDirection.Right);
            if (entity && this.callback)
                this.callback(entity);
        }
    }
}

@reloadable
class Gameplay extends Scene {
    realm?: Realm;
    inventory?: InventoryUI;
    craftUi?: CraftUI;
    hud!: HudUI;
    tooltip!: TooltipUi;
    startPosition: TileVector = new TileVector();
    playerID: EntityID = INVALID_ENTITYID;
    camera: Camera = new Camera();
    interaction: InteractionSystem = new InteractionSystem(this.camera);
    time: number = 0;
    autoSaveTimer: Timer = new Timer();
    fileSize: number = 0;
    saveStreamInfo: WriteStream | null = null;
    saveStream: WriteStream | null = null;
    music!: EventInstance;
    inFlyMode: boolean = false;

    static create() { return new Gameplay(); }

    constructor() {
        super();
        this.music = audio.play("event:/MUSIC/MX_BIOME_1");
    }

    activate(data: LuaTable) {
        CrafterSystem.register();
        InputSystem.register();
        CombatSystem.initialize();
        OverlaySystem.get().loaded();
        BypassSystem.initialize();
        ConduitSystem.initialize();
        DispenserSystem.initialize();
        DrillSystem.initialize();
        CombustSystem.initialize();
        ItemSystem.initialize();
        FarmingSystem.initialize();
        HusbandrySystem.initialize();
        ResearchSystem.initialize();
        LootSystem.initialize();
        PorterSystem.initialize();
        NotificationSystem.initialize();
        WellspringSystem.initialize();
        GameEvents["learnRecipe"].listen(core.cb(ItemSystem, 'handleLearnRecipe'));
        GameEvents["settingChanged"].listen(core.cb(this, "handleSettingChange"));

        World.info = data.get("info") as WorldInfo;
        if (data.has("loading")) {
            tracy.ZoneBeginN("load");
            file.loadAsync(World.contentFile, core.cb(this, "load"));
            tracy.ZoneEnd();
        } else {
            World.info.name = data.get("name") as string;
            TechnologyManager.updateTechnologiesAvailability();
            this.setupWorld();
            this.setupUI();
            TutorialSystem.initialize(EntityManager.get(this.playerID));
        }

        utils.setCrashData(World.info.name, World.info.directory);
    }

    deactivate() {
        log.info("Quitting to main menu");

        EntityManager.get(this.playerID).input.teardown();

        CraftManager.reset();
        CombatSystem.reset();
        ItemSystem.reset();
        TechnologyManager.reset();
        TutorialSystem.reset();
        this.interaction.deactivate();
        const size = Renderer.getSize();
        Renderer.setCamera(new Rect(0, 0, size.x, size.y), 1, new Rect(0, 0, size.x, size.y));

        this.music.stop(FMODStopMode.FMOD_STUDIO_STOP_ALLOWFADEOUT);
        this.music.release();
    }

    postDeactivate() {
        World.destroyRealm(this.realm!.id);
        World.reset();
        this.realm = undefined;

        for (const [key, event] of (GameEvents as LuaTable<string, Event<any>>)) {
            event.clear();
        }
    }

    setupPlayer(realmID: number) {
        let player = EntityManager.create("player.otto");
        let startPosition = this.startPosition.copy();
        player.transform.position = startPosition.asVector();
        player.location.realm = realmID;
        player.location.layer = LayerTypes.Player;
        player.crafter.initialize(player);
        World.addPlayer(player);
        World.move(player, realmID);

        let playerArm = EntityManager.create("player.otto_arm");
        player.attachment.attach(HashString("arm"), playerArm.id, "otto_right_arm", "arm_joint");
        World.move(playerArm, realmID);
        this.playerID = player.id;

        if (settings.getBool(settingkeys.DEVELOPER_MODE_ENABLED)) {
            player.inventory.add(Item.create("structure.transport_tube", 99), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.iron_ore", 50), InventoryFeatures.None, false);
            player.inventory.add(Item.create("structure.wood_chest", 1), InventoryFeatures.None, false);
            player.inventory.add(Item.create("tile.soil", 100), InventoryFeatures.None, false);
            player.inventory.add(Item.create("structure.pump", 10), InventoryFeatures.None, false);
            player.inventory.add(Item.create("structure.pipe", 50), InventoryFeatures.None, false);
            player.inventory.add(Item.create("structure.large_pipe", 50), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.iron_gear", 80), InventoryFeatures.None, false);
            player.inventory.add(Item.create("structure.assembler", 3), InventoryFeatures.None, false);
            player.inventory.add(Item.create("structure.crank_drill", 3), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.iron_ingot", 10), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.silver_ingot", 10), InventoryFeatures.None, false);
            player.inventory.add(Item.create("structure.storage_tank", 10), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.void_matter", 99), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.iron_ingot", 20), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.silver_ingot", 20), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.stone", 20), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.mechanical_essence", 50), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.mana", 20), InventoryFeatures.None, false);
            player.inventory.add(Item.create("material.resin", 20), InventoryFeatures.None, false);
            player.research.speed = 100;
        }
        player.input.setup(player.id, InputStateTypes.Sleep);

        const realm = World.get(realmID);
        this.camera.bounds.set(0, 0, realm.size.x * Sizes.TILE, realm.size.y * Sizes.TILE);
        this.camera.attach(player.id);
        this.camera.zoom = 4;
        return player;
    }

    setupWorld() {
        this.realm = new Realm(World.name, World.getId(), new TileVector(Sizes.REGION_TILE * 13, Sizes.REGION_TILE * 6));
        World.addRealm(this.realm);
        this.realm.initialize();

        let terraformer: Terraformer = new Terraformer(true);
        log.warn(`Generating world with seed: ${World.info.seed}`);
        let data = worldgen.setupTerraformer(this.realm, terraformer, World.info.seed, false);
        terraformer.resume();
        while (!terraformer.isComplete()) {
            terraformer.run();
        }

        this.startPosition = data.startPosition;
        this.realm.lighting.ambientCuttoff = data.surfaceLevel;
        this.realm.lighting.initializeExplored();
        this.realm.focus();

        const regions = this.realm.regions;
        this.realm.regions.setStartingRegion(data.startRegionID);

        this.setupPlayer(this.realm.id);
        this.realm.map.setVisible(false);

        const apotheos = EntityManager.get(this.realm.apotheos);
        animator.play(apotheos, "off");
    }

    setupUI() {
        let player = EntityManager.get(this.playerID);
        this.inventory = new InventoryUI("Inventory", "UIInventoryTitle", player, DialogPlacement.Left);
        this.inventory.setEntity(player);
        this.inventory.dialog.setPosition(610, 610);

        this.craftUi = new CraftUI(player);

        // These UI instances are stored within UIManager
        new ContainerUI(player);
        new ModalUi("Modal");
        this.tooltip = new TooltipUi();
        let modular = new ModularUI(player);
        registerModularLayouts(modular);
        new StorageTankUi(player);
        new SettingsUI(player.id);
        new AncientCommsUI(player);
        new EndingUI(player);

        const research = new ResearchHudUI(player);
        this.hud = new HudUI(player);
        this.hud.show();
        research.hide();

        let apotheosUI = new ApotheosUi(player);
        apotheosUI.setEntity(EntityManager.get(this.realm!.apotheos));

        let mainframeUI = new MainframeUI(player);
        mainframeUI.setEntity(EntityManager.get(this.realm!.mainframe));

        UIManager.finalizeInitialization();

        this.autoSaveTimer.reset(settings.getInt(settingkeys.GENERAL_AUTOSAVE));

        scheduler.add(seconds(1), () => {
            this.music.start();
        });
    }

    update(frameTime: FrameTime) {
        this.camera.update(frameTime);
        if (_G.isPaused) {
            return;
        }

        if (this.autoSaveTimer.updateRestart(frameTime)) {
            this.save();
        }


        if (this.realm && this.playerID != INVALID_ENTITYID) {
            let player = EntityManager.get(this.playerID);
            fmod.updateGlobalParameters(this.realm, player, this.camera);
        }

        Tweening.update(frameTime);
        NotificationSystem.update(frameTime);
        World.update(frameTime);

        if (this.realm) {
            this.realm.biome.updateCamera(this.realm, this.camera, false);

            // Trim off any area that is not within an unlocked region
            let viewport = Renderer.getViewport(RenderPassTypes.Main);
            let areas: Array<TileRect> = [viewport.asTileRect()];

            const regions = this.realm.regions;
            let positions: Array<Vector> = [viewport.topLeft(), viewport.topRight(), viewport.bottomLeft(), viewport.bottomRight()];
            let explored: Set<number> = new Set();
            for (const position of positions) {
                const regionID = regions.getRegionId(position);
                if (regionID >= this.realm.regions.regions.length) {
                    continue;
                }
                const region = this.realm.regions.get(regionID);
                if (region.isEmitted || explored.has(regionID)) {
                    continue;
                }

                let newAreas: Array<TileRect> = [];
                for (const area of areas) {
                    let results = area.difference(region.area.asTileRect());
                    for (let i = 0; i < results.length; i++) {
                        newAreas.push(results[i]);
                    }
                }
                areas = newAreas;
                explored.add(regionID);
            }

            for (const area of areas) {
                this.realm.map.addVisibleArea(area.asTileRect());
            }
        }

        if (this.playerID != INVALID_ENTITYID) {
            let entity = EntityManager.get(this.playerID);
            // entity.transform.scale = new Vector(Math.cos(this.time) * 4, Math.cos(this.time) * 4);
            entity.input.cursor = this.camera.screenToWorld(this.camera.mousePosition);
        }
        this.interaction.update(frameTime);
    }

    updateStart(frameTime: FrameTime) {
        World.updateStart(frameTime);
        scheduler.update(frameTime);
    }

    updateFixed(fixedTime: FrameTime) {
        World.updateFixed(fixedTime);
        this.time += 15.0 / 1000.0;
    }

    cleanup() {
        let destroyed = EntityManager.getDestroyed();
        for (let index = 0; index < destroyed.length; index++) {
            const entityID = destroyed[index];
            World.remove(EntityManager.get(entityID));
        }
        World.cleanup();
    }

    handleSettingChange(setting: HashedString) {
        if (setting == settingkeys.GENERAL_AUTOSAVE) {
            this.autoSaveTimer.reset(settings.getInt(settingkeys.GENERAL_AUTOSAVE));
        }
    }

    handleMouseMotion(position: Vector, relative: Vector) {
        this.camera.mousePosition = position.asVector();
        this.tooltip.position = this.camera.mousePosition.asPixelVector();
        this.interaction.handleMouseMotion(position, relative);
        return false;
    }

    handleMouseWheel(x: number, y: number) {
        // Do not allow changing map mode while the hud is hidden
        if (!this.hud.view.isVisible())
            return false;

        if (this.realm && this.realm.map.isVisible()) {
            const map = this.realm.map;
            let scale = map.getScale();
            if (y > 0 && scale == 4) {
                // Zoomed in to the point that we want to go back to world view
                map.setVisible(false);
                if (this.camera.isAttached) {
                    EntityManager.get(this.playerID).input.input?.enable();
                    this.hud.enterNormalMode();
                } else {
                    let offsetAtScale = this.camera.mousePosition.sub(map.getPosition());
                    let offset = offsetAtScale.div(scale);
                    let position = new Vector(offset.x * Sizes.TILE + Sizes.SUBTILE, offset.y * Sizes.TILE + Sizes.SUBTILE);
                    this.camera.set(position);
                }
            } else if (y > 0 && scale < 4) {
                scale *= 2;
            } else if (y < 0 && scale > 0.5) {
                scale /= 2;
            }
            if (scale != map.getScale()) {
                map.zoomOnPosition(this.camera.mousePosition, scale);
            }
            return true;
        }

        if (y > 0 && this.camera.zoom < 4) {
            this.camera.zoom *= 2;
        } else if (y < 0 && this.camera.zoom > 0.25) {
            if (this.camera.zoom == 0.5) {
                // Zoomed out so far we transfer over to minimap view
                this.realm!.map.center(this.camera.position);
                this.realm!.map.setVisible(true);
                EntityManager.get(this.playerID).input.input?.disable();
                this.hud.enterMapMode();
            } else {
                this.camera.zoom /= 2;
            }
        }
        return false;
    }

    handleKeyDown(state: InputState, mod: number, key: Keyboard) {
        if (!this.realm) {
            return false;
        }

        if (DEBUGGING && key == Keyboard.KEY_DELETE) {
            let player = EntityManager.get(this.playerID);
            let targeted = this.realm.getTargetedFast(player.input.cursor);
            if (targeted && targeted.location.layer != LayerTypes.Player) {
                EntityManager.destroy(targeted.id);
            }
        }

        if (DEBUGGING && key == Keyboard.KEY_L && this.realm) {
            this.realm.lighting.setEnabled(!this.realm.lighting.isEnabled());
        }

        if (DEBUGGING && key == Keyboard.KEY_F10) {
            this.inFlyMode = !this.inFlyMode;
            let player = EntityManager.get(this.playerID);
            player.physics.setEnabled(!this.inFlyMode);
            if (!this.inFlyMode) {
                const position = player.transform.position;
                player.physics.body.setPosition(position.x, position.y);
                player.physics.setAwake(true);
            }
        }

        if (this.inFlyMode && key == Keyboard.KEY_W) {
            let player = EntityManager.get(this.playerID);
            player.transform.position.y -= 20;
            return true;
        }
        if (this.inFlyMode && key == Keyboard.KEY_A) {
            let player = EntityManager.get(this.playerID);
            player.transform.position.x -= 20;
            return true;
        }
        if (this.inFlyMode && key == Keyboard.KEY_S) {
            let player = EntityManager.get(this.playerID);
            player.transform.position.y += 20;
            return true;
        }
        if (this.inFlyMode && key == Keyboard.KEY_D) {
            let player = EntityManager.get(this.playerID);
            player.transform.position.x += 20;
            return true;
        }

        if (UIManager.inCaptureMode() && (InputManager.getModifier() & KeyModifier.MOD_LSHIFT) == KeyModifier.MOD_LSHIFT) {
            if (key == Keyboard.KEY_UP) {
                this.camera.offset.y -= 4;
            }
            if (key == Keyboard.KEY_DOWN) {
                this.camera.offset.y += 4;
            }
            if (key == Keyboard.KEY_LEFT) {
                this.camera.offset.x -= 4;
            }
            if (key == Keyboard.KEY_RIGHT) {
                this.camera.offset.x += 4;
            }
            if (key == Keyboard.KEY_C) {
                let player = EntityManager.get(this.playerID);
                let targeted = this.realm.getTargeted(player.input.cursor);
                if (targeted && targeted.location.layer != LayerTypes.Player) {
                    this.camera.attach(targeted.id);
                }
            }
            if (key == Keyboard.KEY_R) {
                this.camera.offset.reset();
                this.camera.attach(this.playerID);
            }
        }

        if (key == Keyboard.KEY_BACKQUOTE) {
            this.hud.chat.toggleVisibility();
        }
        if (DEBUGGING && key == Keyboard.KEY_P) {
            World.stats.ancientDeviceLevel += 1;
        }
        if (DEBUGGING && key == Keyboard.KEY_F1) {
            UIManager.toggleDebug();
        }
        if (DEBUGGING && key == Keyboard.KEY_F2) {
            _G.showDebugInfo = !_G.showDebugInfo;
        }
        if (DEBUGGING && key == Keyboard.KEY_F3) {
            this.save();
        }
        if (DEBUGGING && key == Keyboard.KEY_F11) {
            this.hud.toggleVisibility();
            UIManager.setCaptureMode(!UIManager.inCaptureMode());
            this.interaction.showCursor = !this.interaction.showCursor;
        }
        if (key == Keyboard.KEY_F12) {
            return true;
        }
        return false;
    }

    handleMouseButtonDown(state: InputState, position: Vector, button: number, clicks: number) {
        return this.interaction.handleMouseButtonDown(state, position, button, true);
    }

    handleMouseButtonUp(state: InputState, position: Vector, button: number) {
        return this.interaction.handleMouseButtonUp(state, position, button);
    }

    save(callback?: () => void) {
        // Save World Info
        this.saveStreamInfo = new WriteStream(1024);
        World.info.version = GAME_VERSION;
        this.saveStreamInfo.serialize(World.info);
        file.saveAsync(World.infoFile, this.saveStreamInfo, (errorCode: number) => {
            this.saveStreamInfo = null;
        });

        // Save World Content
        tracy.ZoneBeginN("serialize");
        tracy.ZoneBeginN("create stream");
        this.saveStream = new WriteStream(this.fileSize);
        tracy.ZoneEnd();
        this.saveStream.writeHandles();
        this.saveStream.uint64(GetGameTicks());

        EntityManager.serialize(this.saveStream);
        World.serialize(this.saveStream);

        this.saveStream.partition();
        this.saveStream.serialize(BypassSystem);
        this.saveStream.serialize(DrillSystem);
        this.saveStream.serialize(FabricatorSystem);
        this.saveStream.serialize(TechnologyManager);
        this.saveStream.serialize(CraftManager);
        this.saveStream.serialize(LootSystem);
        this.saveStream.serialize(FarmingSystem);
        this.saveStream.serialize(HusbandrySystem);
        this.saveStream.serialize(new OldTutorialSystem());
        this.saveStream.serialize(TutorialSystem);
        this.saveStream.serialize(World.stats);
        this.saveStream.merge();

        tracy.ZoneEnd();

        // UI Positions
        this.saveStream.partition();
        this.saveStream.pixelVector((UIManager.get<ViewUI>("Inventory").view as View).getPosition());
        this.saveStream.pixelVector((UIManager.get<ViewUI>("Craft").view as View).getPosition());
        this.saveStream.pixelVector((UIManager.get<ViewUI>("Container").view as View).getPosition());
        this.saveStream.pixelVector((UIManager.get<ViewUI>("Modular").view as View).getPosition());
        this.saveStream.pixelVector((UIManager.get<ViewUI>("Apotheos").view as View).getPosition());
        this.saveStream.pixelVector((UIManager.get<ViewUI>("Research").view as View).getPosition());
        this.saveStream.pixelVector((UIManager.get<ViewUI>("Settings").view as View).getPosition());
        this.saveStream.pixelVector(new PixelVector());
        this.saveStream.merge();

        this.saveStream.partition();
        this.saveStream.serialize(ItemSystem);
        this.saveStream.serialize(this.realm!.foliage);
        this.saveStream.merge();

        tracy.ZoneBeginN("saveAsync");
        this.fileSize = math.floor(this.saveStream.size() * 1.5);
        file.saveAsync(World.contentFile, this.saveStream, (errorCode: number) => {
            this.saveStream = null;
            if (callback) {
                callback();
            }
        });
        tracy.ZoneEnd();
    }

    load(stream: ReadStream) {
        tracy.ZoneBeginN("deserialize");
        this.fileSize = math.floor(stream.size() * 1.5);
        stream.readHandles();
        SetGameTicks(stream.uint64());

        const versioning = World.info.version.isLessThan(new GameVersion(0, 2, 10)) ? 1 : 2;
        EntityManager.deserialize(stream, versioning);
        World.deserialize(stream, (name: string, id: number, size: TileVector) => {
            return new Realm(name, id, size);
        });

        stream.partition();
        stream.deserialize(BypassSystem);
        stream.deserialize(DrillSystem);
        stream.deserialize(FabricatorSystem);
        stream.deserialize(TechnologyManager);
        stream.deserialize(CraftManager);
        TechnologyManager.checkForNewRecipes();
        stream.deserialize(LootSystem);
        stream.deserialize(FarmingSystem);
        stream.deserialize(HusbandrySystem);
        stream.deserialize(new OldTutorialSystem());
        stream.deserialize(TutorialSystem);
        if (!stream.atPartitionEnd()) {
            stream.deserialize(World.stats);
        }
        stream.merge();
        // UI Positions
        stream.partition();
        const inventoryPosition = stream.pixelVector();
        const craftPosition = stream.pixelVector();
        const containerPosition = stream.pixelVector();
        const modularPosition = stream.pixelVector();
        const apotheosPosition = stream.pixelVector();
        const researchPosition = stream.pixelVector();
        const conduitPosition = stream.pixelVector();
        const settingsPosition = stream.pixelVector();
        const filterPosition = stream.pixelVector();
        stream.merge();

        stream.partition();
        stream.deserialize(ItemSystem);
        stream.deserialize(World.get(1).foliage);
        stream.merge();

        this.realm = World.get(1);
        this.realm.focus();
        this.playerID = this.realm.players[0];
        let player = EntityManager.get(this.playerID);
        player.input.setup(player.id, InputStateTypes.Idle);
        player.crafter.initialize(player);
        const harvest = player.stats.get("HARVEST");
        if (harvest.get() == 0.5) {
            harvest.set(2);
        } else if (harvest.get() == 1.0) {
            harvest.set(3);
        }

        this.camera.bounds.set(0, 0, this.realm.size.x * Sizes.TILE, this.realm.size.y * Sizes.TILE);
        this.camera.attach(player.id);
        World.addPlayer(player);
        this.setupUI();

        (UIManager.get<ViewUI>("Inventory").view as View).setPosition(inventoryPosition);
        (UIManager.get<ViewUI>("Craft").view as View).setPosition(craftPosition);
        (UIManager.get<ViewUI>("Container").view as View).setPosition(containerPosition);
        (UIManager.get<ViewUI>("Modular").view as View).setPosition(modularPosition);
        (UIManager.get<ViewUI>("Apotheos").view as View).setPosition(apotheosPosition);
        (UIManager.get<ViewUI>("Settings").view as View).setPosition(settingsPosition);

        // Post loading operations
        SpawnerSystem.get().loaded();

        // VERSION (0.2.10): Upgrade splitter filters to new filtering system
        if (World.info.version.isLessThan(new GameVersion(0, 2, 10))) {
            SplitterSystem.get().loaded();
        }

        scheduler.add(500, core.cb(CombatSystem, "killImmortals"));

        TutorialSystem.initialize(player);

        if (DEBUGGING) {
            this.camera.zoom = 4;
        }

        // VERSION (0.2.8): Ensure all players have the correct inventory size
        let size = 30;
        size += player.armory.has(UpgradeType.CARRY) ? 10 : 0;
        size += player.armory.has(UpgradeType.CARRY_II) ? 10 : 0;
        size += player.armory.has(UpgradeType.CARRY_III) ? 10 : 0;
        const inventory = player.inventory.get();
        if (size > inventory.size) {
            inventory.resize(size);
            let dialog = UIManager.get<InventoryUI>("Inventory");
            dialog.populateDialog();
        }

        // VERSION (0.2.10): Remove shadow pumps
        if (World.info.version.isLessThan(new GameVersion(0, 2, 10))) {
            const offset = EntityManager.offset();
            const count = EntityManager.count() - offset;
            for (let entityID = offset; entityID < count; ++entityID) {
                const entity = EntityManager.get(entityID);
                if (entity == null) {
                    continue;
                }
                if (entity.location.realm == 0) {
                    World.move(entity, this.realm.id);
                    World.remove(entity);
                    EntityManager.destroy(entity.id);
                }
            }
        }

        if (player.stats.get("HP").getCurrent() == 0) {
            scheduler.add(seconds(1), () => {
                player.combat.onDeath(player);
            });
        }

        tracy.ZoneEnd();
    }
}

export { Gameplay as scene, Gameplay };