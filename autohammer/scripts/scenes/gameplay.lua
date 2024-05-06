local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local Set = ____lualib.Set
local __TS__Decorate = ____lualib.__TS__Decorate
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 6,["21"] = 6,["22"] = 7,["23"] = 7,["24"] = 8,["25"] = 8,["26"] = 9,["27"] = 9,["28"] = 10,["29"] = 10,["30"] = 11,["31"] = 11,["32"] = 12,["33"] = 12,["34"] = 13,["35"] = 13,["36"] = 14,["37"] = 14,["38"] = 15,["39"] = 15,["40"] = 16,["41"] = 16,["42"] = 17,["43"] = 17,["44"] = 18,["45"] = 18,["46"] = 19,["47"] = 19,["48"] = 20,["49"] = 20,["50"] = 21,["51"] = 21,["52"] = 22,["53"] = 22,["54"] = 23,["55"] = 23,["56"] = 24,["57"] = 24,["58"] = 25,["59"] = 25,["60"] = 26,["61"] = 26,["62"] = 27,["63"] = 27,["64"] = 28,["65"] = 28,["66"] = 29,["67"] = 29,["68"] = 30,["69"] = 30,["70"] = 31,["71"] = 31,["72"] = 32,["73"] = 32,["74"] = 33,["75"] = 33,["76"] = 34,["77"] = 34,["78"] = 35,["79"] = 35,["80"] = 37,["81"] = 37,["82"] = 38,["83"] = 38,["84"] = 39,["85"] = 39,["86"] = 40,["87"] = 40,["88"] = 41,["89"] = 41,["90"] = 42,["91"] = 42,["92"] = 42,["93"] = 43,["94"] = 43,["95"] = 44,["96"] = 44,["97"] = 45,["98"] = 45,["99"] = 46,["100"] = 46,["101"] = 47,["102"] = 47,["103"] = 48,["104"] = 48,["105"] = 49,["106"] = 49,["107"] = 49,["108"] = 50,["109"] = 50,["110"] = 51,["111"] = 51,["112"] = 52,["113"] = 52,["114"] = 53,["115"] = 53,["116"] = 53,["117"] = 54,["118"] = 54,["119"] = 55,["120"] = 55,["121"] = 58,["122"] = 60,["123"] = 60,["124"] = 66,["125"] = 63,["126"] = 67,["127"] = 68,["128"] = 69,["129"] = 66,["130"] = 72,["131"] = 73,["132"] = 74,["133"] = 75,["134"] = 76,["135"] = 76,["136"] = 77,["137"] = 78,["139"] = 75,["140"] = 72,["141"] = 83,["142"] = 84,["143"] = 85,["144"] = 85,["145"] = 85,["146"] = 85,["147"] = 85,["148"] = 85,["149"] = 86,["150"] = 87,["153"] = 83,["154"] = 92,["155"] = 92,["156"] = 93,["158"] = 93,["159"] = 99,["160"] = 100,["161"] = 101,["162"] = 102,["163"] = 103,["164"] = 104,["165"] = 105,["166"] = 106,["167"] = 107,["168"] = 109,["169"] = 115,["170"] = 113,["171"] = 111,["172"] = 111,["173"] = 111,["174"] = 118,["175"] = 119,["176"] = 120,["177"] = 121,["178"] = 122,["179"] = 123,["180"] = 124,["181"] = 125,["182"] = 126,["183"] = 127,["184"] = 128,["185"] = 129,["186"] = 130,["187"] = 131,["188"] = 132,["189"] = 133,["190"] = 134,["191"] = 135,["192"] = 136,["193"] = 137,["194"] = 139,["195"] = 140,["196"] = 141,["197"] = 142,["198"] = 142,["199"] = 142,["200"] = 142,["201"] = 143,["203"] = 145,["204"] = 146,["205"] = 147,["206"] = 148,["207"] = 149,["209"] = 152,["210"] = 118,["211"] = 155,["212"] = 156,["213"] = 158,["214"] = 160,["215"] = 161,["216"] = 162,["217"] = 163,["218"] = 164,["219"] = 165,["220"] = 166,["221"] = 167,["222"] = 167,["223"] = 167,["224"] = 167,["225"] = 167,["226"] = 169,["227"] = 170,["228"] = 155,["229"] = 173,["230"] = 174,["231"] = 175,["232"] = 176,["233"] = 178,["234"] = 179,["236"] = 173,["237"] = 183,["238"] = 184,["239"] = 185,["240"] = 186,["241"] = 187,["242"] = 188,["243"] = 189,["244"] = 190,["245"] = 191,["246"] = 193,["247"] = 194,["248"] = 194,["249"] = 194,["250"] = 194,["251"] = 194,["252"] = 194,["253"] = 195,["254"] = 196,["255"] = 198,["256"] = 199,["257"] = 199,["258"] = 199,["259"] = 199,["260"] = 199,["261"] = 200,["262"] = 200,["263"] = 200,["264"] = 200,["265"] = 200,["266"] = 201,["267"] = 201,["268"] = 201,["269"] = 201,["270"] = 201,["271"] = 202,["272"] = 202,["273"] = 202,["274"] = 202,["275"] = 202,["276"] = 203,["277"] = 203,["278"] = 203,["279"] = 203,["280"] = 203,["281"] = 204,["282"] = 204,["283"] = 204,["284"] = 204,["285"] = 204,["286"] = 205,["287"] = 205,["288"] = 205,["289"] = 205,["290"] = 205,["291"] = 206,["292"] = 206,["293"] = 206,["294"] = 206,["295"] = 206,["296"] = 207,["297"] = 207,["298"] = 207,["299"] = 207,["300"] = 207,["301"] = 208,["302"] = 208,["303"] = 208,["304"] = 208,["305"] = 208,["306"] = 209,["307"] = 209,["308"] = 209,["309"] = 209,["310"] = 209,["311"] = 210,["312"] = 210,["313"] = 210,["314"] = 210,["315"] = 210,["316"] = 211,["317"] = 211,["318"] = 211,["319"] = 211,["320"] = 211,["321"] = 212,["322"] = 212,["323"] = 212,["324"] = 212,["325"] = 212,["326"] = 213,["327"] = 213,["328"] = 213,["329"] = 213,["330"] = 213,["331"] = 214,["332"] = 214,["333"] = 214,["334"] = 214,["335"] = 214,["336"] = 215,["337"] = 215,["338"] = 215,["339"] = 215,["340"] = 215,["341"] = 216,["342"] = 216,["343"] = 216,["344"] = 216,["345"] = 216,["346"] = 217,["347"] = 217,["348"] = 217,["349"] = 217,["350"] = 217,["351"] = 218,["352"] = 218,["353"] = 218,["354"] = 218,["355"] = 218,["356"] = 219,["358"] = 221,["359"] = 223,["360"] = 224,["361"] = 225,["362"] = 226,["363"] = 227,["364"] = 183,["365"] = 230,["366"] = 231,["367"] = 231,["368"] = 231,["369"] = 231,["370"] = 231,["371"] = 231,["372"] = 232,["373"] = 233,["374"] = 235,["375"] = 236,["376"] = 237,["377"] = 238,["378"] = 239,["379"] = 240,["381"] = 243,["382"] = 244,["383"] = 245,["384"] = 246,["385"] = 248,["386"] = 249,["387"] = 251,["388"] = 252,["389"] = 254,["390"] = 255,["391"] = 230,["392"] = 258,["393"] = 259,["394"] = 260,["395"] = 260,["396"] = 260,["397"] = 260,["398"] = 260,["399"] = 260,["400"] = 260,["401"] = 261,["402"] = 262,["403"] = 264,["404"] = 267,["405"] = 268,["406"] = 269,["407"] = 270,["408"] = 271,["409"] = 272,["410"] = 273,["411"] = 274,["412"] = 275,["413"] = 277,["414"] = 278,["415"] = 279,["416"] = 280,["417"] = 282,["418"] = 283,["419"] = 285,["420"] = 286,["421"] = 288,["422"] = 290,["423"] = 292,["424"] = 292,["425"] = 292,["426"] = 293,["427"] = 292,["428"] = 292,["429"] = 258,["430"] = 297,["431"] = 298,["432"] = 299,["435"] = 303,["436"] = 304,["438"] = 308,["439"] = 309,["440"] = 310,["442"] = 313,["443"] = 314,["444"] = 315,["445"] = 317,["446"] = 318,["447"] = 321,["448"] = 322,["449"] = 324,["450"] = 325,["451"] = 325,["452"] = 325,["453"] = 325,["454"] = 325,["455"] = 325,["456"] = 326,["457"] = 327,["459"] = 328,["460"] = 329,["461"] = 330,["463"] = 332,["464"] = 333,["465"] = 334,["467"] = 337,["468"] = 338,["469"] = 339,["471"] = 340,["472"] = 340,["473"] = 341,["474"] = 340,["478"] = 344,["479"] = 345,["483"] = 348,["484"] = 349,["487"] = 353,["488"] = 354,["489"] = 356,["491"] = 358,["492"] = 297,["493"] = 361,["494"] = 362,["495"] = 363,["496"] = 361,["497"] = 366,["498"] = 367,["499"] = 368,["500"] = 366,["501"] = 371,["502"] = 372,["504"] = 373,["505"] = 373,["506"] = 374,["507"] = 375,["508"] = 373,["511"] = 377,["512"] = 371,["513"] = 380,["514"] = 381,["515"] = 382,["517"] = 380,["518"] = 386,["519"] = 387,["520"] = 388,["521"] = 389,["522"] = 390,["523"] = 386,["524"] = 393,["525"] = 395,["526"] = 396,["528"] = 398,["529"] = 399,["530"] = 400,["531"] = 401,["532"] = 403,["533"] = 404,["534"] = 405,["536"] = 405,["538"] = 406,["540"] = 408,["541"] = 409,["542"] = 410,["543"] = 411,["545"] = 413,["546"] = 414,["547"] = 415,["548"] = 416,["550"] = 418,["551"] = 419,["553"] = 421,["555"] = 424,["556"] = 425,["557"] = 425,["558"] = 426,["559"] = 427,["560"] = 429,["561"] = 430,["562"] = 431,["564"] = 431,["566"] = 432,["568"] = 434,["569"] = 434,["572"] = 437,["573"] = 393,["574"] = 440,["575"] = 441,["576"] = 442,["578"] = 445,["579"] = 446,["580"] = 447,["581"] = 448,["582"] = 449,["585"] = 453,["586"] = 454,["588"] = 457,["589"] = 458,["590"] = 459,["591"] = 460,["592"] = 461,["593"] = 462,["594"] = 463,["595"] = 464,["598"] = 468,["599"] = 469,["600"] = 470,["601"] = 470,["602"] = 471,["604"] = 473,["605"] = 474,["606"] = 475,["607"] = 475,["608"] = 476,["610"] = 478,["611"] = 479,["612"] = 480,["613"] = 480,["614"] = 481,["616"] = 483,["617"] = 484,["618"] = 485,["619"] = 485,["620"] = 486,["622"] = 489,["623"] = 489,["624"] = 489,["625"] = 489,["626"] = 490,["627"] = 491,["628"] = 491,["630"] = 493,["631"] = 494,["632"] = 494,["634"] = 496,["635"] = 497,["636"] = 497,["638"] = 499,["639"] = 500,["640"] = 500,["642"] = 502,["643"] = 503,["644"] = 504,["645"] = 505,["646"] = 506,["649"] = 509,["650"] = 510,["651"] = 511,["654"] = 515,["655"] = 516,["657"] = 518,["658"] = 519,["659"] = 519,["661"] = 521,["662"] = 522,["664"] = 524,["665"] = 525,["667"] = 527,["668"] = 528,["670"] = 530,["671"] = 531,["672"] = 532,["673"] = 533,["675"] = 535,["676"] = 536,["678"] = 538,["679"] = 440,["680"] = 541,["681"] = 542,["682"] = 541,["683"] = 545,["684"] = 546,["685"] = 545,["686"] = 549,["687"] = 551,["688"] = 552,["689"] = 553,["690"] = 554,["691"] = 554,["692"] = 554,["693"] = 554,["694"] = 555,["695"] = 554,["696"] = 554,["697"] = 559,["698"] = 560,["699"] = 561,["700"] = 562,["701"] = 563,["702"] = 564,["703"] = 566,["704"] = 567,["705"] = 569,["706"] = 570,["707"] = 571,["708"] = 572,["709"] = 573,["710"] = 574,["711"] = 575,["712"] = 576,["713"] = 577,["714"] = 578,["715"] = 579,["716"] = 580,["717"] = 581,["718"] = 583,["719"] = 586,["720"] = 587,["721"] = 588,["722"] = 589,["723"] = 590,["724"] = 591,["725"] = 592,["726"] = 593,["727"] = 594,["728"] = 595,["729"] = 597,["730"] = 598,["731"] = 599,["732"] = 600,["733"] = 602,["734"] = 603,["735"] = 604,["736"] = 604,["737"] = 604,["738"] = 604,["739"] = 605,["740"] = 606,["741"] = 607,["743"] = 604,["744"] = 604,["745"] = 610,["746"] = 549,["747"] = 613,["748"] = 614,["749"] = 615,["750"] = 616,["751"] = 617,["752"] = 619,["753"] = 620,["754"] = 621,["755"] = 621,["756"] = 621,["757"] = 622,["758"] = 621,["759"] = 621,["760"] = 625,["761"] = 626,["762"] = 627,["763"] = 628,["764"] = 629,["765"] = 630,["766"] = 631,["767"] = 632,["768"] = 633,["769"] = 634,["770"] = 635,["771"] = 636,["772"] = 637,["773"] = 638,["775"] = 640,["776"] = 642,["777"] = 643,["778"] = 644,["779"] = 645,["780"] = 646,["781"] = 647,["782"] = 648,["783"] = 649,["784"] = 650,["785"] = 651,["786"] = 652,["787"] = 654,["788"] = 655,["789"] = 656,["790"] = 657,["791"] = 659,["792"] = 660,["793"] = 661,["794"] = 662,["795"] = 663,["796"] = 664,["797"] = 665,["798"] = 666,["799"] = 667,["800"] = 668,["801"] = 669,["803"] = 672,["804"] = 673,["805"] = 674,["806"] = 675,["807"] = 677,["808"] = 678,["809"] = 679,["810"] = 680,["811"] = 681,["812"] = 682,["813"] = 685,["814"] = 688,["815"] = 689,["817"] = 692,["818"] = 692,["819"] = 692,["820"] = 692,["821"] = 694,["822"] = 696,["823"] = 697,["825"] = 701,["826"] = 702,["827"] = 703,["828"] = 704,["829"] = 705,["830"] = 706,["831"] = 707,["832"] = 708,["833"] = 709,["835"] = 713,["836"] = 714,["837"] = 715,["839"] = 716,["840"] = 716,["842"] = 717,["843"] = 718,["844"] = 719,["846"] = 721,["847"] = 722,["848"] = 723,["849"] = 724,["853"] = 716,["857"] = 729,["858"] = 730,["859"] = 730,["860"] = 730,["861"] = 731,["862"] = 730,["863"] = 730,["865"] = 735,["866"] = 613,["867"] = 92,["868"] = 739,["869"] = 739});
local ____exports = {}
local ____fmod = require("fmod")
local fmod = ____fmod.fmod
local ____world = require("world")
local World = ____world.World
local ____realm = require("realm")
local Realm = ____realm.Realm
local ____reload = require("reload")
local reloadable = ____reload.reloadable
local ____scene = require("scenes.scene")
local Scene = ____scene.Scene
local ____inventory = require("ui.inventory")
local InventoryUI = ____inventory.InventoryUI
local ____container = require("ui.container")
local ContainerUI = ____container.ContainerUI
local ____craft = require("ui.craft")
local CraftUI = ____craft.CraftUI
local ____hud = require("ui.hud")
local HudUI = ____hud.HudUI
local ____craft = require("systems.craft")
local CraftManager = ____craft.CraftManager
local ____combust = require("systems.combust")
local CombustSystem = ____combust.CombustSystem
local ____camera = require("camera")
local Camera = ____camera.Camera
local ____interaction = require("systems.interaction")
local InteractionSystem = ____interaction.InteractionSystem
local ____architect = require("architect")
local architect = ____architect.architect
local ____Sizes = require("Sizes")
local Sizes = ____Sizes.Sizes
local ____apotheos = require("ui.apotheos")
local ApotheosUi = ____apotheos.ApotheosUi
local ____input = require("systems.input")
local InputSystem = ____input.InputSystem
local ____combat = require("systems.combat")
local CombatSystem = ____combat.CombatSystem
local ____tween = require("systems.tween")
local Tweening = ____tween.Tweening
local ____core = require("core")
local core = ____core.core
local ____scheduler = require("systems.scheduler")
local scheduler = ____scheduler.scheduler
local ____bypass = require("systems.bypass")
local BypassSystem = ____bypass.BypassSystem
local ____porter = require("systems.porter")
local PorterSystem = ____porter.PorterSystem
local ____drill = require("systems.drill")
local DrillSystem = ____drill.DrillSystem
local ____location = require("components.location")
local LayerTypes = ____location.LayerTypes
local ____direction = require("direction")
local FacingDirection = ____direction.FacingDirection
local ____item = require("systems.item")
local ItemSystem = ____item.ItemSystem
local ____modal = require("ui.modal")
local ModalUi = ____modal.ModalUi
local ____tooltip = require("ui.tooltip")
local TooltipUi = ____tooltip.TooltipUi
local ____fabricator = require("systems.fabricator")
local FabricatorSystem = ____fabricator.FabricatorSystem
local ____crafter = require("systems.crafter")
local CrafterSystem = ____crafter.CrafterSystem
local ____farming = require("systems.farming")
local FarmingSystem = ____farming.FarmingSystem
local ____technology = require("systems.technology")
local TechnologyManager = ____technology.TechnologyManager
local ____research = require("systems.research")
local ResearchSystem = ____research.ResearchSystem
local ____loot = require("systems.loot")
local LootSystem = ____loot.LootSystem
local ____dispenser = require("systems.dispenser")
local DispenserSystem = ____dispenser.DispenserSystem
local ____husbandry = require("systems.husbandry")
local HusbandrySystem = ____husbandry.HusbandrySystem
local ____settings_ingame = require("ui.settings_ingame")
local SettingsUI = ____settings_ingame.SettingsUI
local ____research = require("ui.research")
local ResearchHudUI = ____research.ResearchHudUI
local ____notification = require("systems.notification")
local NotificationSystem = ____notification.NotificationSystem
local ____tutorial = require("systems.tutorial")
local OldTutorialSystem = ____tutorial.OldTutorialSystem
local TutorialSystem = ____tutorial.TutorialSystem
local ____wellspring = require("systems.wellspring")
local WellspringSystem = ____wellspring.WellspringSystem
local ____input = require("components.input")
local InputStateTypes = ____input.InputStateTypes
local ____storage_tank = require("ui.storage_tank")
local StorageTankUi = ____storage_tank.StorageTankUi
local ____worldgen = require("systems.worldgen")
local worldgen = ____worldgen.worldgen
local ____conduit = require("systems.conduit")
local ConduitSystem = ____conduit.ConduitSystem
local ____mainframe = require("ui.mainframe")
local MainframeUI = ____mainframe.MainframeUI
local ____modular = require("ui.modular")
local ModularUI = ____modular.ModularUI
local registerModularLayouts = ____modular.registerModularLayouts
local ____event = require("event")
local GameEvents = ____event.GameEvents
local ____ancient_comms = require("ui.ancient_comms")
local AncientCommsUI = ____ancient_comms.AncientCommsUI
local ____ending = require("ui.ending")
local EndingUI = ____ending.EndingUI
local ____version = require("version")
local GAME_VERSION = ____version.GAME_VERSION
local GameVersion = ____version.GameVersion
local ____upgrades = require("upgrades")
local UpgradeType = ____upgrades.UpgradeType
local ____settings = require("ui.settings")
local settingkeys = ____settings.settingkeys
local DEBUGGING = settings.getBool(settingkeys.DEBUGGING_MODE_ENABLED)
local EntityPlacer = __TS__Class()
EntityPlacer.name = "EntityPlacer"
function EntityPlacer.prototype.____constructor(self, prefabKey, color, callback)
    self.positions = {}
    self.prefab = Prefab.get(prefabKey)
    self.color = color
    self.callback = callback
end
function EntityPlacer.prototype.addTo(self, realm, rules)
    local soilID = Prefab.get("tile.soil").tile.id
    local map = realm.backwall.map
    rules[self.color.uid] = function(____, position)
        local ____self_positions_0 = self.positions
        ____self_positions_0[#____self_positions_0 + 1] = position:copy()
        if not map:isEmpty(TileVector.new(position.x, position.y - 1)) then
            map:set(position, soilID, 1)
        end
    end
end
function EntityPlacer.prototype.place(self, realm)
    for ____, position in ipairs(self.positions) do
        local entity = architect:calculateCreatePlacement(
            realm.id,
            self.prefab,
            position:asVector(),
            FacingDirection.Right
        )
        if entity and self.callback then
            self:callback(entity)
        end
    end
end
local Gameplay = __TS__Class()
Gameplay.name = "Gameplay"
__TS__ClassExtends(Gameplay, Scene)
function Gameplay.prototype.____constructor(self)
    Scene.prototype.____constructor(self)
    self.startPosition = TileVector.new()
    self.playerID = INVALID_ENTITYID
    self.camera = __TS__New(Camera)
    self.interaction = __TS__New(InteractionSystem, self.camera)
    self.time = 0
    self.autoSaveTimer = Timer.new()
    self.fileSize = 0
    self.saveStreamInfo = nil
    self.saveStream = nil
    self.inFlyMode = false
    self.music = audio.play("event:/MUSIC/MX_BIOME_1")
end
function Gameplay.create(self)
    return __TS__New(Gameplay)
end
function Gameplay.prototype.activate(self, data)
    CrafterSystem:register()
    InputSystem:register()
    CombatSystem:initialize()
    OverlaySystem.get():loaded()
    BypassSystem:initialize()
    ConduitSystem:initialize()
    DispenserSystem:initialize()
    DrillSystem:initialize()
    CombustSystem:initialize()
    ItemSystem:initialize()
    FarmingSystem:initialize()
    HusbandrySystem:initialize()
    ResearchSystem:initialize()
    LootSystem:initialize()
    PorterSystem:initialize()
    NotificationSystem:initialize()
    WellspringSystem:initialize()
    GameEvents.learnRecipe:listen(core.cb(ItemSystem, "handleLearnRecipe"))
    GameEvents.settingChanged:listen(core.cb(self, "handleSettingChange"))
    World.info = data.info
    if data.loading ~= nil then
        tracy.ZoneBeginN("load")
        file.loadAsync(
            World.contentFile,
            core.cb(self, "load")
        )
        tracy.ZoneEnd()
    else
        World.info.name = data.name
        TechnologyManager:updateTechnologiesAvailability()
        self:setupWorld()
        self:setupUI()
        TutorialSystem:initialize(EntityManager.get(self.playerID))
    end
    utils.setCrashData(World.info.name, World.info.directory)
end
function Gameplay.prototype.deactivate(self)
    log.info("Quitting to main menu")
    EntityManager.get(self.playerID).input:teardown()
    CraftManager:reset()
    CombatSystem:reset()
    ItemSystem:reset()
    TechnologyManager:reset()
    TutorialSystem:reset()
    self.interaction:deactivate()
    local size = Renderer.getSize()
    Renderer.setCamera(
        Rect.new(0, 0, size.x, size.y),
        1,
        Rect.new(0, 0, size.x, size.y)
    )
    self.music:stop(FMODStopMode.FMOD_STUDIO_STOP_ALLOWFADEOUT)
    self.music:release()
end
function Gameplay.prototype.postDeactivate(self)
    World:destroyRealm(self.realm.id)
    World:reset()
    self.realm = nil
    for key, event in pairs(GameEvents) do
        event:clear()
    end
end
function Gameplay.prototype.setupPlayer(self, realmID)
    local player = EntityManager.create("player.otto")
    local startPosition = self.startPosition:copy()
    player.transform.position = startPosition:asVector()
    player.location.realm = realmID
    player.location.layer = LayerTypes.Player
    player.crafter:initialize(player)
    World:addPlayer(player)
    World:move(player, realmID)
    local playerArm = EntityManager.create("player.otto_arm")
    player.attachment:attach(
        HashString("arm"),
        playerArm.id,
        "otto_right_arm",
        "arm_joint"
    )
    World:move(playerArm, realmID)
    self.playerID = player.id
    if settings.getBool(settingkeys.DEVELOPER_MODE_ENABLED) then
        player.inventory:add(
            Item.create("structure.transport_tube", 99),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.iron_ore", 50),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("structure.wood_chest", 1),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("tile.soil", 100),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("structure.pump", 10),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("structure.pipe", 50),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("structure.large_pipe", 50),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.iron_gear", 80),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("structure.assembler", 3),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("structure.crank_drill", 3),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.iron_ingot", 10),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.silver_ingot", 10),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("structure.storage_tank", 10),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.void_matter", 99),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.iron_ingot", 20),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.silver_ingot", 20),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.stone", 20),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.mechanical_essence", 50),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.mana", 20),
            InventoryFeatures.None,
            false
        )
        player.inventory:add(
            Item.create("material.resin", 20),
            InventoryFeatures.None,
            false
        )
        player.research.speed = 100
    end
    player.input:setup(player.id, InputStateTypes.Sleep)
    local realm = World:get(realmID)
    self.camera.bounds:set(0, 0, realm.size.x * Sizes.TILE, realm.size.y * Sizes.TILE)
    self.camera:attach(player.id)
    self.camera.zoom = 4
    return player
end
function Gameplay.prototype.setupWorld(self)
    self.realm = __TS__New(
        Realm,
        World.name,
        World:getId(),
        TileVector.new(Sizes.REGION_TILE * 13, Sizes.REGION_TILE * 6)
    )
    World:addRealm(self.realm)
    self.realm:initialize()
    local terraformer = Terraformer.new(true)
    log.warn("Generating world with seed: " .. tostring(World.info.seed))
    local data = worldgen.setupTerraformer(self.realm, terraformer, World.info.seed, false)
    terraformer:resume()
    while not terraformer:isComplete() do
        terraformer:run()
    end
    self.startPosition = data.startPosition
    self.realm.lighting.ambientCuttoff = data.surfaceLevel
    self.realm.lighting:initializeExplored()
    self.realm:focus()
    local regions = self.realm.regions
    self.realm.regions:setStartingRegion(data.startRegionID)
    self:setupPlayer(self.realm.id)
    self.realm.map:setVisible(false)
    local apotheos = EntityManager.get(self.realm.apotheos)
    animator.play(apotheos, "off")
end
function Gameplay.prototype.setupUI(self)
    local player = EntityManager.get(self.playerID)
    self.inventory = __TS__New(
        InventoryUI,
        "Inventory",
        "UIInventoryTitle",
        player,
        DialogPlacement.Left
    )
    self.inventory:setEntity(player)
    self.inventory.dialog:setPosition(610, 610)
    self.craftUi = __TS__New(CraftUI, player)
    __TS__New(ContainerUI, player)
    __TS__New(ModalUi, "Modal")
    self.tooltip = __TS__New(TooltipUi)
    local modular = __TS__New(ModularUI, player)
    registerModularLayouts(nil, modular)
    __TS__New(StorageTankUi, player)
    __TS__New(SettingsUI, player.id)
    __TS__New(AncientCommsUI, player)
    __TS__New(EndingUI, player)
    local research = __TS__New(ResearchHudUI, player)
    self.hud = __TS__New(HudUI, player)
    self.hud:show()
    research:hide()
    local apotheosUI = __TS__New(ApotheosUi, player)
    apotheosUI:setEntity(EntityManager.get(self.realm.apotheos))
    local mainframeUI = __TS__New(MainframeUI, player)
    mainframeUI:setEntity(EntityManager.get(self.realm.mainframe))
    UIManager.finalizeInitialization()
    self.autoSaveTimer:reset(settings.getInt(settingkeys.GENERAL_AUTOSAVE))
    scheduler:add(
        seconds(1),
        function()
            self.music:start()
        end
    )
end
function Gameplay.prototype.update(self, frameTime)
    self.camera:update(frameTime)
    if _G.isPaused then
        return
    end
    if self.autoSaveTimer:updateRestart(frameTime) then
        self:save()
    end
    if self.realm and self.playerID ~= INVALID_ENTITYID then
        local player = EntityManager.get(self.playerID)
        fmod:updateGlobalParameters(self.realm, player, self.camera)
    end
    Tweening:update(frameTime)
    NotificationSystem:update(frameTime)
    World:update(frameTime)
    if self.realm then
        self.realm.biome:updateCamera(self.realm, self.camera, false)
        local viewport = Renderer.getViewport(RenderPassTypes.Main)
        local areas = {viewport:asTileRect()}
        local regions = self.realm.regions
        local positions = {
            viewport:topLeft(),
            viewport:topRight(),
            viewport:bottomLeft(),
            viewport:bottomRight()
        }
        local explored = __TS__New(Set)
        for ____, position in ipairs(positions) do
            do
                local regionID = regions:getRegionId(position)
                if regionID >= #self.realm.regions.regions then
                    goto __continue29
                end
                local region = self.realm.regions:get(regionID)
                if region.isEmitted or explored:has(regionID) then
                    goto __continue29
                end
                local newAreas = {}
                for ____, area in ipairs(areas) do
                    local results = area:difference(region.area:asTileRect())
                    do
                        local i = 0
                        while i < #results do
                            newAreas[#newAreas + 1] = results[i + 1]
                            i = i + 1
                        end
                    end
                end
                areas = newAreas
                explored:add(regionID)
            end
            ::__continue29::
        end
        for ____, area in ipairs(areas) do
            self.realm.map:addVisibleArea(area:asTileRect())
        end
    end
    if self.playerID ~= INVALID_ENTITYID then
        local entity = EntityManager.get(self.playerID)
        entity.input.cursor = self.camera:screenToWorld(self.camera.mousePosition)
    end
    self.interaction:update(frameTime)
end
function Gameplay.prototype.updateStart(self, frameTime)
    World:updateStart(frameTime)
    scheduler:update(frameTime)
end
function Gameplay.prototype.updateFixed(self, fixedTime)
    World:updateFixed(fixedTime)
    self.time = self.time + 15 / 1000
end
function Gameplay.prototype.cleanup(self)
    local destroyed = EntityManager.getDestroyed()
    do
        local index = 0
        while index < #destroyed do
            local entityID = destroyed[index + 1]
            World:remove(EntityManager.get(entityID))
            index = index + 1
        end
    end
    World:cleanup()
end
function Gameplay.prototype.handleSettingChange(self, setting)
    if setting == settingkeys.GENERAL_AUTOSAVE then
        self.autoSaveTimer:reset(settings.getInt(settingkeys.GENERAL_AUTOSAVE))
    end
end
function Gameplay.prototype.handleMouseMotion(self, position, relative)
    self.camera.mousePosition = position:asVector()
    self.tooltip.position = self.camera.mousePosition:asPixelVector()
    self.interaction:handleMouseMotion(position, relative)
    return false
end
function Gameplay.prototype.handleMouseWheel(self, x, y)
    if not self.hud.view:isVisible() then
        return false
    end
    if self.realm and self.realm.map:isVisible() then
        local map = self.realm.map
        local scale = map:getScale()
        if y > 0 and scale == 4 then
            map:setVisible(false)
            if self.camera.isAttached then
                local ____opt_1 = EntityManager.get(self.playerID).input.input
                if ____opt_1 ~= nil then
                    ____opt_1:enable()
                end
                self.hud:enterNormalMode()
            else
                local offsetAtScale = self.camera.mousePosition - map:getPosition()
                local offset = offsetAtScale / scale
                local position = Vector.new(offset.x * Sizes.TILE + Sizes.SUBTILE, offset.y * Sizes.TILE + Sizes.SUBTILE)
                self.camera:set(position)
            end
        elseif y > 0 and scale < 4 then
            scale = scale * 2
        elseif y < 0 and scale > 0.5 then
            scale = scale / 2
        end
        if scale ~= map:getScale() then
            map:zoomOnPosition(self.camera.mousePosition, scale)
        end
        return true
    end
    if y > 0 and self.camera.zoom < 4 then
        local ____self_camera_3, ____zoom_4 = self.camera, "zoom"
        ____self_camera_3[____zoom_4] = ____self_camera_3[____zoom_4] * 2
    elseif y < 0 and self.camera.zoom > 0.25 then
        if self.camera.zoom == 0.5 then
            self.realm.map:center(self.camera.position)
            self.realm.map:setVisible(true)
            local ____opt_5 = EntityManager.get(self.playerID).input.input
            if ____opt_5 ~= nil then
                ____opt_5:disable()
            end
            self.hud:enterMapMode()
        else
            local ____self_camera_7, ____zoom_8 = self.camera, "zoom"
            ____self_camera_7[____zoom_8] = ____self_camera_7[____zoom_8] / 2
        end
    end
    return false
end
function Gameplay.prototype.handleKeyDown(self, state, mod, key)
    if not self.realm then
        return false
    end
    if DEBUGGING and key == Keyboard.KEY_DELETE then
        local player = EntityManager.get(self.playerID)
        local targeted = self.realm:getTargetedFast(player.input.cursor)
        if targeted and targeted.location.layer ~= LayerTypes.Player then
            EntityManager.destroy(targeted.id)
        end
    end
    if DEBUGGING and key == Keyboard.KEY_L and self.realm then
        self.realm.lighting:setEnabled(not self.realm.lighting:isEnabled())
    end
    if DEBUGGING and key == Keyboard.KEY_F10 then
        self.inFlyMode = not self.inFlyMode
        local player = EntityManager.get(self.playerID)
        player.physics:setEnabled(not self.inFlyMode)
        if not self.inFlyMode then
            local position = player.transform.position
            player.physics.body:setPosition(position.x, position.y)
            player.physics:setAwake(true)
        end
    end
    if self.inFlyMode and key == Keyboard.KEY_W then
        local player = EntityManager.get(self.playerID)
        local ____player_transform_position_9, ____y_10 = player.transform.position, "y"
        ____player_transform_position_9[____y_10] = ____player_transform_position_9[____y_10] - 20
        return true
    end
    if self.inFlyMode and key == Keyboard.KEY_A then
        local player = EntityManager.get(self.playerID)
        local ____player_transform_position_11, ____x_12 = player.transform.position, "x"
        ____player_transform_position_11[____x_12] = ____player_transform_position_11[____x_12] - 20
        return true
    end
    if self.inFlyMode and key == Keyboard.KEY_S then
        local player = EntityManager.get(self.playerID)
        local ____player_transform_position_13, ____y_14 = player.transform.position, "y"
        ____player_transform_position_13[____y_14] = ____player_transform_position_13[____y_14] + 20
        return true
    end
    if self.inFlyMode and key == Keyboard.KEY_D then
        local player = EntityManager.get(self.playerID)
        local ____player_transform_position_15, ____x_16 = player.transform.position, "x"
        ____player_transform_position_15[____x_16] = ____player_transform_position_15[____x_16] + 20
        return true
    end
    if UIManager.inCaptureMode() and bit.band(
        InputManager.getModifier(),
        KeyModifier.MOD_LSHIFT
    ) == KeyModifier.MOD_LSHIFT then
        if key == Keyboard.KEY_UP then
            local ____self_camera_offset_17, ____y_18 = self.camera.offset, "y"
            ____self_camera_offset_17[____y_18] = ____self_camera_offset_17[____y_18] - 4
        end
        if key == Keyboard.KEY_DOWN then
            local ____self_camera_offset_19, ____y_20 = self.camera.offset, "y"
            ____self_camera_offset_19[____y_20] = ____self_camera_offset_19[____y_20] + 4
        end
        if key == Keyboard.KEY_LEFT then
            local ____self_camera_offset_21, ____x_22 = self.camera.offset, "x"
            ____self_camera_offset_21[____x_22] = ____self_camera_offset_21[____x_22] - 4
        end
        if key == Keyboard.KEY_RIGHT then
            local ____self_camera_offset_23, ____x_24 = self.camera.offset, "x"
            ____self_camera_offset_23[____x_24] = ____self_camera_offset_23[____x_24] + 4
        end
        if key == Keyboard.KEY_C then
            local player = EntityManager.get(self.playerID)
            local targeted = self.realm:getTargeted(player.input.cursor)
            if targeted and targeted.location.layer ~= LayerTypes.Player then
                self.camera:attach(targeted.id)
            end
        end
        if key == Keyboard.KEY_R then
            self.camera.offset:reset()
            self.camera:attach(self.playerID)
        end
    end
    if key == Keyboard.KEY_BACKQUOTE then
        self.hud.chat:toggleVisibility()
    end
    if DEBUGGING and key == Keyboard.KEY_P then
        local ____World_stats_25, ____ancientDeviceLevel_26 = World.stats, "ancientDeviceLevel"
        ____World_stats_25[____ancientDeviceLevel_26] = ____World_stats_25[____ancientDeviceLevel_26] + 1
    end
    if DEBUGGING and key == Keyboard.KEY_F1 then
        UIManager.toggleDebug()
    end
    if DEBUGGING and key == Keyboard.KEY_F2 then
        _G.showDebugInfo = not _G.showDebugInfo
    end
    if DEBUGGING and key == Keyboard.KEY_F3 then
        self:save()
    end
    if DEBUGGING and key == Keyboard.KEY_F11 then
        self.hud:toggleVisibility()
        UIManager.setCaptureMode(not UIManager.inCaptureMode())
        self.interaction.showCursor = not self.interaction.showCursor
    end
    if key == Keyboard.KEY_F12 then
        return true
    end
    return false
end
function Gameplay.prototype.handleMouseButtonDown(self, state, position, button, clicks)
    return self.interaction:handleMouseButtonDown(state, position, button, true)
end
function Gameplay.prototype.handleMouseButtonUp(self, state, position, button)
    return self.interaction:handleMouseButtonUp(state, position, button)
end
function Gameplay.prototype.save(self, callback)
    self.saveStreamInfo = WriteStream.new(1024)
    World.info.version = GAME_VERSION
    self.saveStreamInfo:serialize(World.info)
    file.saveAsync(
        World.infoFile,
        self.saveStreamInfo,
        function(____, errorCode)
            self.saveStreamInfo = nil
        end
    )
    tracy.ZoneBeginN("serialize")
    tracy.ZoneBeginN("create stream")
    self.saveStream = WriteStream.new(self.fileSize)
    tracy.ZoneEnd()
    self.saveStream:writeHandles()
    self.saveStream:uint64(GetGameTicks())
    EntityManager.serialize(self.saveStream)
    World:serialize(self.saveStream)
    self.saveStream:partition()
    self.saveStream:serialize(BypassSystem)
    self.saveStream:serialize(DrillSystem)
    self.saveStream:serialize(FabricatorSystem)
    self.saveStream:serialize(TechnologyManager)
    self.saveStream:serialize(CraftManager)
    self.saveStream:serialize(LootSystem)
    self.saveStream:serialize(FarmingSystem)
    self.saveStream:serialize(HusbandrySystem)
    self.saveStream:serialize(__TS__New(OldTutorialSystem))
    self.saveStream:serialize(TutorialSystem)
    self.saveStream:serialize(World.stats)
    self.saveStream:merge()
    tracy.ZoneEnd()
    self.saveStream:partition()
    self.saveStream:pixelVector(UIManager.get("Inventory").view:getPosition())
    self.saveStream:pixelVector(UIManager.get("Craft").view:getPosition())
    self.saveStream:pixelVector(UIManager.get("Container").view:getPosition())
    self.saveStream:pixelVector(UIManager.get("Modular").view:getPosition())
    self.saveStream:pixelVector(UIManager.get("Apotheos").view:getPosition())
    self.saveStream:pixelVector(UIManager.get("Research").view:getPosition())
    self.saveStream:pixelVector(UIManager.get("Settings").view:getPosition())
    self.saveStream:pixelVector(PixelVector.new())
    self.saveStream:merge()
    self.saveStream:partition()
    self.saveStream:serialize(ItemSystem)
    self.saveStream:serialize(self.realm.foliage)
    self.saveStream:merge()
    tracy.ZoneBeginN("saveAsync")
    self.fileSize = math.floor(self.saveStream:size() * 1.5)
    file.saveAsync(
        World.contentFile,
        self.saveStream,
        function(____, errorCode)
            self.saveStream = nil
            if callback then
                callback(nil)
            end
        end
    )
    tracy.ZoneEnd()
end
function Gameplay.prototype.load(self, stream)
    tracy.ZoneBeginN("deserialize")
    self.fileSize = math.floor(stream:size() * 1.5)
    stream:readHandles()
    SetGameTicks(stream:uint64())
    local versioning = World.info.version:isLessThan(__TS__New(GameVersion, 0, 2, 10)) and 1 or 2
    EntityManager.deserialize(stream, versioning)
    World:deserialize(
        stream,
        function(____, name, id, size)
            return __TS__New(Realm, name, id, size)
        end
    )
    stream:partition()
    stream:deserialize(BypassSystem)
    stream:deserialize(DrillSystem)
    stream:deserialize(FabricatorSystem)
    stream:deserialize(TechnologyManager)
    stream:deserialize(CraftManager)
    TechnologyManager:checkForNewRecipes()
    stream:deserialize(LootSystem)
    stream:deserialize(FarmingSystem)
    stream:deserialize(HusbandrySystem)
    stream:deserialize(__TS__New(OldTutorialSystem))
    stream:deserialize(TutorialSystem)
    if not stream:atPartitionEnd() then
        stream:deserialize(World.stats)
    end
    stream:merge()
    stream:partition()
    local inventoryPosition = stream:pixelVector()
    local craftPosition = stream:pixelVector()
    local containerPosition = stream:pixelVector()
    local modularPosition = stream:pixelVector()
    local apotheosPosition = stream:pixelVector()
    local researchPosition = stream:pixelVector()
    local conduitPosition = stream:pixelVector()
    local settingsPosition = stream:pixelVector()
    local filterPosition = stream:pixelVector()
    stream:merge()
    stream:partition()
    stream:deserialize(ItemSystem)
    stream:deserialize(World:get(1).foliage)
    stream:merge()
    self.realm = World:get(1)
    self.realm:focus()
    self.playerID = self.realm.players[1]
    local player = EntityManager.get(self.playerID)
    player.input:setup(player.id, InputStateTypes.Idle)
    player.crafter:initialize(player)
    local harvest = player.stats:get("HARVEST")
    if harvest:get() == 0.5 then
        harvest:set(2)
    elseif harvest:get() == 1 then
        harvest:set(3)
    end
    self.camera.bounds:set(0, 0, self.realm.size.x * Sizes.TILE, self.realm.size.y * Sizes.TILE)
    self.camera:attach(player.id)
    World:addPlayer(player)
    self:setupUI()
    UIManager.get("Inventory").view:setPosition(inventoryPosition)
    UIManager.get("Craft").view:setPosition(craftPosition)
    UIManager.get("Container").view:setPosition(containerPosition)
    UIManager.get("Modular").view:setPosition(modularPosition)
    UIManager.get("Apotheos").view:setPosition(apotheosPosition)
    UIManager.get("Settings").view:setPosition(settingsPosition)
    SpawnerSystem.get():loaded()
    if World.info.version:isLessThan(__TS__New(GameVersion, 0, 2, 10)) then
        SplitterSystem.get():loaded()
    end
    scheduler:add(
        500,
        core.cb(CombatSystem, "killImmortals")
    )
    TutorialSystem:initialize(player)
    if DEBUGGING then
        self.camera.zoom = 4
    end
    local size = 30
    size = size + (player.armory:has(UpgradeType.CARRY) and 10 or 0)
    size = size + (player.armory:has(UpgradeType.CARRY_II) and 10 or 0)
    size = size + (player.armory:has(UpgradeType.CARRY_III) and 10 or 0)
    local inventory = player.inventory:get()
    if size > inventory.size then
        inventory:resize(size)
        local dialog = UIManager.get("Inventory")
        dialog:populateDialog()
    end
    if World.info.version:isLessThan(__TS__New(GameVersion, 0, 2, 10)) then
        local offset = EntityManager.offset()
        local count = EntityManager.count() - offset
        do
            local entityID = offset
            while entityID < count do
                do
                    local entity = EntityManager.get(entityID)
                    if entity == nil then
                        goto __continue100
                    end
                    if entity.location.realm == 0 then
                        World:move(entity, self.realm.id)
                        World:remove(entity)
                        EntityManager.destroy(entity.id)
                    end
                end
                ::__continue100::
                entityID = entityID + 1
            end
        end
    end
    if player.stats:get("HP"):getCurrent() == 0 then
        scheduler:add(
            seconds(1),
            function()
                player.combat:onDeath(player)
            end
        )
    end
    tracy.ZoneEnd()
end
Gameplay = __TS__Decorate({reloadable}, Gameplay)
____exports.scene = Gameplay
____exports.Gameplay = Gameplay
return ____exports
