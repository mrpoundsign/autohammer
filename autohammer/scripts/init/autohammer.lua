local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 4,["11"] = 4,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 6,["17"] = 6,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 8,["22"] = 6,["23"] = 6,["24"] = 6,["25"] = 5,["26"] = 13});
local ____exports = {}
local ____command = require("systems.command")
local Commands = ____command.Commands
local Command = ____command.Command
local AutoHammerInit = __TS__Class()
AutoHammerInit.name = "AutoHammerInit"
function AutoHammerInit.prototype.____constructor(self)
    Commands.commands:set(
        "/hammer",
        __TS__New(
            Command,
            "hammer",
            "// Hammer",
            function(____, player, content)
                local chat = UIManager.get("Hud").chat
                chat:receive("AutoHammer Reporting In For Duty!")
            end
        )
    )
end
____exports.AutoHammer = __TS__New(AutoHammerInit)
return ____exports
