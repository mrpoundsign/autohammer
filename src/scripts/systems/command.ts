import { Sizes } from "../Sizes";
import { architect } from "../architect";
import { GameEvents } from "../event";
import { HudUI } from "../ui/hud";
import { World } from "../world";
import { ArmoryManager } from "./armory";
import { NotificationSystem } from "./notification";
import { TechnologyManager } from "./technology";
import { Handler as AHCommandHandler } from "../autohammer/systems/commands";

class Command {
    name: string;
    helpText: string;
    callback: (player: Entity, content: Array<string>) => void;

    constructor(name: string, helpText: string, callback: (player: Entity, content: Array<string>) => void) {
        this.name = name;
        this.helpText = helpText;
        this.callback = callback;
    }
}

class CommandSystem {
    commands: Map<string, Command> = new Map();

    constructor() {
        this.commands.set("/help", new Command("help", "// Displays this help message", (player: Entity, content: Array<string>) => {
            const chat = UIManager.get<HudUI>("Hud").chat;
            for (const command of this.commands) {
                if (!AHCommandHandler.IsEnabled(command[1].name)) continue;

                chat.receive(`${command[0]} ${command[1].helpText}`);
            }
        }));

        let itemCommand = (player: Entity, content: Array<string>) => {
            let prefabID = Prefab.findBest(content[1]);
            if (prefabID != INVALID_ENTITYID && EntityManager.get(prefabID).item != null) {
                player.inventory.add(new Item(prefabID, tonumber(content[2]) || 1), InventoryFeatures.Collect, true);
            }
        }

        this.commands.set("/item", new Command("item", "<prefab_name> <quantity?> // Adds the item to your inventory", itemCommand));

        this.commands.set("/get", new Command("get", "<prefab_name> <quantity?> // Gets the item to your inventory", itemCommand));

        this.commands.set("/spawn", new Command("spawn", "<prefab_name> // Spawns the entity at cursor", (player: Entity, content: Array<string>) => {
            let prefabKey = content[1];
            if (Prefab.exists(prefabKey)) {
                const prefab = Prefab.get(prefabKey);
                if (prefab.item !== null)
                    architect.createDropped(player.location.realm, player.input.cursor, Item.create(prefabKey, tonumber(content[2])));
                else {
                    let entity = EntityManager.create(prefab, player.input.cursor);
                    World.move(entity, player.location.realm, entity.location.layer);
                }
            }
        }));

        this.commands.set("/warp", new Command("warp", "// Warps the player to the cursor", (player: Entity, content: Array<string>) => {
            const transform = player.transform;
            const physics = player.physics;
            if (content.length == 3) {
                transform.position.set(tonumber(content[1])! * Sizes.TILE, tonumber(content[2])! * Sizes.TILE);
            } else {
                transform.position = player.input.cursor;
            }
            physics.body.setPosition(transform.position.x + physics.offset.x, transform.position.y + physics.offset.y);
            physics.setAwake(true);
        }));

        this.commands.set("/map", new Command("map", "// Unlocks all regions in the world", (player: Entity, content: Array<string>) => {
            const realm = World.get(player.location.realm);
            for (const region of realm.regions.regions) {
                region.isEmitted = true;
                region.isExplored = true;
                GameEvents["emitRegion"].invoke(region.id);
            }
        }));

        this.commands.set("/tech", new Command("tech", "// Unlocks all technologies", (player: Entity, content: Array<string>) => {
            for (const technology of TechnologyManager.technologies) {
                technology[1].isAvailable = true;
                TechnologyManager.research(technology[1]);
            }
        }));

        this.commands.set("/wave", new Command("wave", "// Spawns a monster wave at your cursor", (player: Entity, content: Array<string>) => {
            let start = player.input.cursor;
            const count = tonumber(content[1]) || 10;
            const realm = World.get(player.location.realm);
            realm.invasion.create(realm, start, count, Direction.Left, INVALID_ENTITYID);
            NotificationSystem.handleInvasion();
        }));

        this.commands.set("/time", new Command("time", "<0-23> // Changes the time of day", (player: Entity, content: Array<string>) => {
            const hour = tonumber(content[1]) || 0;
            const realm = World.get(player.location.realm);
            realm.time.setHour(hour);
        }));

        this.commands.set("/pace", new Command("pace", "<number> // Changes the speed of the game time", (player: Entity, content: Array<string>) => {
            const pace = tonumber(content[1]) || 0;
            const realm = World.get(player.location.realm);
            realm.time.setPace(pace);
        }));

        this.commands.set("/upgrade", new Command("upgrade", "// Unlocks all upgrades", (player: Entity, content: Array<string>) => {
            const armory = player.armory;
            for (const upgrade of ArmoryManager.upgrades) {
                armory.upgrades.add(upgrade[0]);
                if (upgrade[1].activate != null) {
                    upgrade[1].activate(player);
                }
            }
        }));

        this.commands.set("/skin", new Command("skin", "// Changes Otto's skin", (player: Entity, content: Array<string>) => {
            if (content.length > 1) {
                animator.setAssociation(player, content[1]);
            }
        }));
    }

    addCommand(command: Command) {
        this.commands.set(command.name, command);
    }

    handle(playerID: EntityID, message: string) {
        if (!message.startsWith("/")) return false;

        let content = message.split(" ");
        let name = content[0];

        let command = this.commands.get(name);

        if (command === undefined) {
            const chat = UIManager.get<HudUI>("Hud").chat;
            chat.receive(`Unknown command: ${name}`);
            return false;
        }

        if (!AHCommandHandler.IsEnabled(command.name)) return false;

        command.callback(EntityManager.get(playerID), content);

        return true;
    }
}



declare var _G: any;

if (_G.Commands === undefined) {
    _G.Commands = new CommandSystem();
}

const Commands = _G.Commands as CommandSystem;

export { Command, Commands, CommandSystem };
