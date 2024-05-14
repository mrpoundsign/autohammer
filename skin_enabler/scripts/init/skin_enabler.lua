local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3});
local ____exports = {}
local ____commands = require("autohammer.systems.commands")
local Handler = ____commands.Handler
Handler:Enable("skin")
return ____exports
