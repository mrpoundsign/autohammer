local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["17"] = 8,["18"] = 4,["19"] = 12});
local ____exports = {}
local ____quickbar = require("autohammer.quickbar")
local AHQuickbar = ____quickbar.AHQuickbar
local QuickbarNoSwap = __TS__Class()
QuickbarNoSwap.name = "QuickbarNoSwap"
function QuickbarNoSwap.prototype.____constructor(self)
end
function QuickbarNoSwap.prototype.set(self, quickbarIndex, index, entityID, curr)
    if entityID ~= INVALID_ENTITYID and curr ~= INVALID_ENTITYID then
        return false
    end
    return true
end
AHQuickbar:registerQuickbarSetHandler(__TS__New(QuickbarNoSwap))
return ____exports
