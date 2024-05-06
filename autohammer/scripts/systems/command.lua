local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 3,["16"] = 3,["17"] = 5,["18"] = 5,["19"] = 6,["20"] = 6,["21"] = 7,["22"] = 7,["23"] = 8,["24"] = 8,["25"] = 9,["26"] = 9,["27"] = 11,["28"] = 11,["29"] = 16,["30"] = 17,["31"] = 18,["32"] = 19,["33"] = 16,["34"] = 23,["35"] = 25,["36"] = 25,["38"] = 26,["39"] = 30,["40"] = 30,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 30,["46"] = 31,["47"] = 32,["48"] = 33,["50"] = 30,["51"] = 30,["52"] = 30,["53"] = 37,["56"] = 39,["57"] = 40,["58"] = 41,["59"] = 42,["60"] = 42,["61"] = 42,["62"] = 42,["63"] = 42,["64"] = 42,["65"] = 42,["66"] = 42,["68"] = 39,["69"] = 46,["70"] = 46,["71"] = 46,["72"] = 46,["73"] = 47,["74"] = 47,["75"] = 47,["76"] = 47,["77"] = 49,["78"] = 49,["79"] = 49,["80"] = 49,["81"] = 49,["82"] = 49,["83"] = 49,["84"] = 50,["85"] = 51,["86"] = 52,["87"] = 53,["88"] = 54,["89"] = 54,["90"] = 54,["91"] = 54,["92"] = 54,["93"] = 54,["94"] = 54,["95"] = 54,["97"] = 56,["98"] = 57,["101"] = 49,["102"] = 49,["103"] = 49,["104"] = 62,["105"] = 62,["106"] = 62,["107"] = 62,["108"] = 62,["109"] = 62,["110"] = 62,["111"] = 63,["112"] = 64,["113"] = 65,["114"] = 66,["115"] = 66,["116"] = 66,["117"] = 66,["119"] = 68,["121"] = 70,["122"] = 71,["123"] = 62,["124"] = 62,["125"] = 62,["126"] = 74,["127"] = 74,["128"] = 74,["129"] = 74,["130"] = 74,["131"] = 74,["132"] = 74,["133"] = 75,["134"] = 76,["135"] = 77,["136"] = 78,["137"] = 79,["139"] = 74,["140"] = 74,["141"] = 74,["142"] = 83,["143"] = 83,["144"] = 83,["145"] = 83,["146"] = 83,["147"] = 83,["148"] = 83,["149"] = 84,["150"] = 85,["151"] = 86,["153"] = 83,["154"] = 83,["155"] = 83,["156"] = 90,["157"] = 90,["158"] = 90,["159"] = 90,["160"] = 90,["161"] = 90,["162"] = 90,["163"] = 91,["164"] = 92,["165"] = 93,["166"] = 94,["167"] = 94,["168"] = 94,["169"] = 94,["170"] = 94,["171"] = 94,["172"] = 94,["173"] = 95,["174"] = 90,["175"] = 90,["176"] = 90,["177"] = 98,["178"] = 98,["179"] = 98,["180"] = 98,["181"] = 98,["182"] = 98,["183"] = 98,["184"] = 99,["185"] = 100,["186"] = 101,["187"] = 98,["188"] = 98,["189"] = 98,["190"] = 104,["191"] = 104,["192"] = 104,["193"] = 104,["194"] = 104,["195"] = 104,["196"] = 104,["197"] = 105,["198"] = 106,["199"] = 107,["200"] = 104,["201"] = 104,["202"] = 104,["203"] = 110,["204"] = 110,["205"] = 110,["206"] = 110,["207"] = 110,["208"] = 110,["209"] = 110,["210"] = 111,["211"] = 112,["212"] = 113,["213"] = 114,["214"] = 115,["217"] = 110,["218"] = 110,["219"] = 110,["220"] = 120,["221"] = 120,["222"] = 120,["223"] = 120,["224"] = 120,["225"] = 120,["226"] = 120,["227"] = 121,["228"] = 122,["230"] = 120,["231"] = 120,["232"] = 120,["233"] = 28,["234"] = 127,["235"] = 128,["236"] = 127,["237"] = 131,["238"] = 132,["239"] = 132,["241"] = 134,["242"] = 135,["243"] = 137,["244"] = 138,["245"] = 139,["246"] = 139,["247"] = 139,["248"] = 139,["250"] = 142,["251"] = 131,["252"] = 150,["253"] = 151,["255"] = 154,["256"] = 156,["257"] = 156,["258"] = 156});
local ____exports = {}
local ____Sizes = require("Sizes")
local Sizes = ____Sizes.Sizes
local ____architect = require("architect")
local architect = ____architect.architect
local ____event = require("event")
local GameEvents = ____event.GameEvents
local ____world = require("world")
local World = ____world.World
local ____armory = require("systems.armory")
local ArmoryManager = ____armory.ArmoryManager
local ____notification = require("systems.notification")
local NotificationSystem = ____notification.NotificationSystem
local ____technology = require("systems.technology")
local TechnologyManager = ____technology.TechnologyManager
local ____settings = require("ui.settings")
local settingkeys = ____settings.settingkeys
local Command = __TS__Class()
Command.name = "Command"
function Command.prototype.____constructor(self, name, helpText, callback)
    self.name = name
    self.helpText = helpText
    self.callback = callback
end
local DEBUGGING = settings.getBool(settingkeys.DEBUGGING_MODE_ENABLED)
local CommandSystem = __TS__Class()
CommandSystem.name = "CommandSystem"
function CommandSystem.prototype.____constructor(self)
    self.commands = __TS__New(Map)
    self.commands:set(
        "/help",
        __TS__New(
            Command,
            "help",
            "// Displays this help message",
            function(____, player, content)
                local chat = UIManager.get("Hud").chat
                for ____, command in __TS__Iterator(self.commands) do
                    chat:receive((command[1] .. " ") .. command[2].helpText)
                end
            end
        )
    )
    if not DEBUGGING then
        return
    end
    local function itemCommand(____, player, content)
        local prefabID = Prefab.findBest(content[2])
        if prefabID ~= INVALID_ENTITYID and EntityManager.get(prefabID).item ~= nil then
            player.inventory:add(
                Item.new(
                    prefabID,
                    tonumber(content[3]) or 1
                ),
                InventoryFeatures.Collect,
                true
            )
        end
    end
    self.commands:set(
        "/item",
        __TS__New(Command, "item", "<prefab_name> <quantity?> // Adds the item to your inventory", itemCommand)
    )
    self.commands:set(
        "/get",
        __TS__New(Command, "get", "<prefab_name> <quantity?> // Gets the item to your inventory", itemCommand)
    )
    self.commands:set(
        "/spawn",
        __TS__New(
            Command,
            "spawn",
            "<prefab_name> // Spawns the entity at cursor",
            function(____, player, content)
                local prefabKey = content[2]
                if Prefab.exists(prefabKey) then
                    local prefab = Prefab.get(prefabKey)
                    if prefab.item ~= nil then
                        architect:createDropped(
                            player.location.realm,
                            player.input.cursor,
                            Item.create(
                                prefabKey,
                                tonumber(content[3])
                            )
                        )
                    else
                        local entity = EntityManager.create(prefab, player.input.cursor)
                        World:move(entity, player.location.realm, entity.location.layer)
                    end
                end
            end
        )
    )
    self.commands:set(
        "/warp",
        __TS__New(
            Command,
            "warp",
            "// Warps the player to the cursor",
            function(____, player, content)
                local transform = player.transform
                local physics = player.physics
                if #content == 3 then
                    transform.position:set(
                        tonumber(content[2]) * Sizes.TILE,
                        tonumber(content[3]) * Sizes.TILE
                    )
                else
                    transform.position = player.input.cursor
                end
                physics.body:setPosition(transform.position.x + physics.offset.x, transform.position.y + physics.offset.y)
                physics:setAwake(true)
            end
        )
    )
    self.commands:set(
        "/map",
        __TS__New(
            Command,
            "map",
            "// Unlocks all regions in the world",
            function(____, player, content)
                local realm = World:get(player.location.realm)
                for ____, region in ipairs(realm.regions.regions) do
                    region.isEmitted = true
                    region.isExplored = true
                    GameEvents.emitRegion:invoke(region.id)
                end
            end
        )
    )
    self.commands:set(
        "/tech",
        __TS__New(
            Command,
            "tech",
            "// Unlocks all technologies",
            function(____, player, content)
                for ____, technology in __TS__Iterator(TechnologyManager.technologies) do
                    technology[2].isAvailable = true
                    TechnologyManager:research(technology[2])
                end
            end
        )
    )
    self.commands:set(
        "/wave",
        __TS__New(
            Command,
            "wave",
            "// Spawns a monster wave at your cursor",
            function(____, player, content)
                local start = player.input.cursor
                local count = tonumber(content[2]) or 10
                local realm = World:get(player.location.realm)
                realm.invasion:create(
                    realm,
                    start,
                    count,
                    Direction.Left,
                    INVALID_ENTITYID
                )
                NotificationSystem:handleInvasion()
            end
        )
    )
    self.commands:set(
        "/time",
        __TS__New(
            Command,
            "time",
            "<0-23> // Changes the time of day",
            function(____, player, content)
                local hour = tonumber(content[2]) or 0
                local realm = World:get(player.location.realm)
                realm.time:setHour(hour)
            end
        )
    )
    self.commands:set(
        "/pace",
        __TS__New(
            Command,
            "pace",
            "<number> // Changes the speed of the game time",
            function(____, player, content)
                local pace = tonumber(content[2]) or 0
                local realm = World:get(player.location.realm)
                realm.time:setPace(pace)
            end
        )
    )
    self.commands:set(
        "/upgrade",
        __TS__New(
            Command,
            "upgrade",
            "// Unlocks all upgrades",
            function(____, player, content)
                local armory = player.armory
                for ____, upgrade in __TS__Iterator(ArmoryManager.upgrades) do
                    armory.upgrades:add(upgrade[1])
                    if upgrade[2].activate ~= nil then
                        upgrade[2]:activate(player)
                    end
                end
            end
        )
    )
    self.commands:set(
        "/skin",
        __TS__New(
            Command,
            "skin",
            "// Changes Otto's skin",
            function(____, player, content)
                if #content > 1 then
                    animator.setAssociation(player, content[2])
                end
            end
        )
    )
end
function CommandSystem.prototype.addCommand(self, command)
    self.commands:set(command.name, command)
end
function CommandSystem.prototype.handle(self, playerID, message)
    if not __TS__StringStartsWith(message, "/") then
        return false
    end
    local content = __TS__StringSplit(message, " ")
    local name = content[1]
    local command = self.commands:get(name)
    if command then
        command:callback(
            EntityManager.get(playerID),
            content
        )
    end
    return true
end
if _G.Commands == nil then
    _G.Commands = __TS__New(CommandSystem)
end
local Commands = _G.Commands
____exports.Command = Command
____exports.Commands = Commands
____exports.CommandSystem = CommandSystem
return ____exports
