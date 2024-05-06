local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 8,["8"] = 8,["10"] = 10,["11"] = 8,["12"] = 13,["13"] = 14,["14"] = 14,["15"] = 13,["16"] = 18,["17"] = 19,["18"] = 20,["19"] = 21,["22"] = 25,["23"] = 18,["24"] = 29,["25"] = 31});
local ____exports = {}
local QuickbarHandler = __TS__Class()
QuickbarHandler.name = "QuickbarHandler"
function QuickbarHandler.prototype.____constructor(self)
    self.quickbarSetHandlers = {}
end
function QuickbarHandler.prototype.registerQuickbarSetHandler(self, handler)
    local ____self_quickbarSetHandlers_0 = self.quickbarSetHandlers
    ____self_quickbarSetHandlers_0[#____self_quickbarSetHandlers_0 + 1] = handler
end
function QuickbarHandler.prototype.QuickbarSet(self, quickbarIndex, index, entityID, curr)
    for ____, handler in ipairs(self.quickbarSetHandlers) do
        if not handler:set(quickbarIndex, index, entityID, curr) then
            return false
        end
    end
    return true
end
local AHQuickbar = __TS__New(QuickbarHandler)
____exports.AHQuickbar = AHQuickbar
return ____exports
