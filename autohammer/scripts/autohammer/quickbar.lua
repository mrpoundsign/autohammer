local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 4,["20"] = 4,["21"] = 4,["22"] = 16,["23"] = 16,["25"] = 18,["26"] = 16,["27"] = 21,["28"] = 22,["29"] = 22,["30"] = 21,["31"] = 26,["32"] = 27,["33"] = 28,["34"] = 29,["37"] = 33,["38"] = 26,["39"] = 37,["40"] = 39});
local ____exports = {}
local ____command = require("systems.command")
local Commands = ____command.Commands
local Command = ____command.Command
Commands.commands:set(
    "/mrforge",
    __TS__New(
        Command,
        "mrforge",
        "// Mr. Forge",
        function(____, player, content)
            local chat = UIManager.get("Hud").chat
            chat:receive("Mr. Forge Reporting In For Duty!")
        end
    )
)
local QuickbarHandler = __TS__Class()
QuickbarHandler.name = "QuickbarHandler"
function QuickbarHandler.prototype.____constructor(self)
    self.quickbarSetHandlers = {}
end
function QuickbarHandler.prototype.registerQuickbarSetHandler(self, handler)
    local ____self_quickbarSetHandlers_0 = self.quickbarSetHandlers
    ____self_quickbarSetHandlers_0[#____self_quickbarSetHandlers_0 + 1] = handler
end
function QuickbarHandler.prototype.QuickbarSet(self, quickbarIndex, index, entityID)
    for ____, handler in ipairs(self.quickbarSetHandlers) do
        if not handler:set(quickbarIndex, index, entityID) then
            return false
        end
    end
    return true
end
local AHQuickbar = __TS__New(QuickbarHandler)
____exports.AHQuickbar = AHQuickbar
return ____exports
