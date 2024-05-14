local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 3,["16"] = 3,["17"] = 5,["18"] = 5,["19"] = 6,["20"] = 6,["21"] = 7,["22"] = 7,["23"] = 8,["24"] = 8,["25"] = 9,["26"] = 9,["27"] = 11,["28"] = 11,["29"] = 16,["30"] = 17,["31"] = 18,["32"] = 19,["33"] = 16,["34"] = 23,["35"] = 23,["37"] = 24,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 28,["46"] = 29,["48"] = 30,["49"] = 30,["51"] = 32,["55"] = 27,["56"] = 27,["57"] = 27,["58"] = 36,["59"] = 37,["60"] = 38,["61"] = 39,["62"] = 39,["63"] = 39,["64"] = 39,["65"] = 39,["66"] = 39,["67"] = 39,["68"] = 39,["70"] = 36,["71"] = 43,["72"] = 43,["73"] = 43,["74"] = 43,["75"] = 45,["76"] = 45,["77"] = 45,["78"] = 45,["79"] = 47,["80"] = 47,["81"] = 47,["82"] = 47,["83"] = 47,["84"] = 47,["85"] = 47,["86"] = 48,["87"] = 49,["88"] = 50,["89"] = 51,["90"] = 52,["91"] = 52,["92"] = 52,["93"] = 52,["94"] = 52,["95"] = 52,["96"] = 52,["97"] = 52,["99"] = 54,["100"] = 55,["103"] = 47,["104"] = 47,["105"] = 47,["106"] = 60,["107"] = 60,["108"] = 60,["109"] = 60,["110"] = 60,["111"] = 60,["112"] = 60,["113"] = 61,["114"] = 62,["115"] = 63,["116"] = 64,["117"] = 64,["118"] = 64,["119"] = 64,["121"] = 66,["123"] = 68,["124"] = 69,["125"] = 60,["126"] = 60,["127"] = 60,["128"] = 72,["129"] = 72,["130"] = 72,["131"] = 72,["132"] = 72,["133"] = 72,["134"] = 72,["135"] = 73,["136"] = 74,["137"] = 75,["138"] = 76,["139"] = 77,["141"] = 72,["142"] = 72,["143"] = 72,["144"] = 81,["145"] = 81,["146"] = 81,["147"] = 81,["148"] = 81,["149"] = 81,["150"] = 81,["151"] = 82,["152"] = 83,["153"] = 84,["155"] = 81,["156"] = 81,["157"] = 81,["158"] = 88,["159"] = 88,["160"] = 88,["161"] = 88,["162"] = 88,["163"] = 88,["164"] = 88,["165"] = 89,["166"] = 90,["167"] = 91,["168"] = 92,["169"] = 92,["170"] = 92,["171"] = 92,["172"] = 92,["173"] = 92,["174"] = 92,["175"] = 93,["176"] = 88,["177"] = 88,["178"] = 88,["179"] = 96,["180"] = 96,["181"] = 96,["182"] = 96,["183"] = 96,["184"] = 96,["185"] = 96,["186"] = 97,["187"] = 98,["188"] = 99,["189"] = 96,["190"] = 96,["191"] = 96,["192"] = 102,["193"] = 102,["194"] = 102,["195"] = 102,["196"] = 102,["197"] = 102,["198"] = 102,["199"] = 103,["200"] = 104,["201"] = 105,["202"] = 102,["203"] = 102,["204"] = 102,["205"] = 108,["206"] = 108,["207"] = 108,["208"] = 108,["209"] = 108,["210"] = 108,["211"] = 108,["212"] = 109,["213"] = 110,["214"] = 111,["215"] = 112,["216"] = 113,["219"] = 108,["220"] = 108,["221"] = 108,["222"] = 118,["223"] = 118,["224"] = 118,["225"] = 118,["226"] = 118,["227"] = 118,["228"] = 118,["229"] = 119,["230"] = 120,["232"] = 118,["233"] = 118,["234"] = 118,["235"] = 26,["236"] = 125,["237"] = 126,["238"] = 125,["239"] = 129,["240"] = 130,["241"] = 130,["243"] = 132,["244"] = 133,["245"] = 135,["246"] = 137,["247"] = 138,["248"] = 139,["249"] = 140,["251"] = 143,["252"] = 143,["254"] = 145,["255"] = 145,["256"] = 145,["257"] = 145,["258"] = 147,["259"] = 129,["260"] = 155,["261"] = 156,["263"] = 159,["264"] = 161,["265"] = 161,["266"] = 161});
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
local ____commands = require("autohammer.systems.commands")
local AHCommandHandler = ____commands.Handler
local Command = __TS__Class()
Command.name = "Command"
function Command.prototype.____constructor(self, name, helpText, callback)
    self.name = name
    self.helpText = helpText
    self.callback = callback
end
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
                    do
                        if not AHCommandHandler:IsEnabled(command[2].name) then
                            goto __continue5
                        end
                        chat:receive((command[1] .. " ") .. command[2].helpText)
                    end
                    ::__continue5::
                end
            end
        )
    )
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
    if command == nil then
        local chat = UIManager.get("Hud").chat
        chat:receive("Unknown command: " .. name)
        return false
    end
    if not AHCommandHandler:IsEnabled(command.name) then
        return false
    end
    command:callback(
        EntityManager.get(playerID),
        content
    )
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
