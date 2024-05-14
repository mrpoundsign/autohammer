local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 3,["14"] = 5,["15"] = 10,["16"] = 9,["17"] = 13,["18"] = 14,["19"] = 14,["20"] = 14,["22"] = 14,["23"] = 14,["25"] = 14,["27"] = 13,["28"] = 17,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 17,["35"] = 21,["36"] = 22,["37"] = 23,["38"] = 24,["40"] = 27,["41"] = 21,["42"] = 31,["43"] = 33});
local ____exports = {}
local ____settings = require("ui.settings")
local settingkeys = ____settings.settingkeys
local CommandHandler = __TS__Class()
CommandHandler.name = "CommandHandler"
function CommandHandler.prototype.____constructor(self)
    self.commands = {"help"}
    log.info("CommandHandler constructor")
end
function CommandHandler.prototype.Enable(self, command)
    local ____temp_2
    if __TS__ArrayIndexOf(self.commands, command) == -1 then
        local ____self_commands_0 = self.commands
        local ____temp_1 = #____self_commands_0 + 1
        ____self_commands_0[____temp_1] = command
        ____temp_2 = ____temp_1
    else
        ____temp_2 = nil
    end
end
function CommandHandler.prototype.Disable(self, command)
    local ____ = __TS__ArrayIndexOf(self.commands, command) ~= -1 and __TS__ArraySplice(
        self.commands,
        __TS__ArrayIndexOf(self.commands, command),
        1
    ) or nil
end
function CommandHandler.prototype.IsEnabled(self, command)
    log.info((("IsEnabled:" .. command) .. ":") .. tostring(__TS__ArrayIndexOf(self.commands, command) ~= -1))
    if settings.getBool(settingkeys.DEBUGGING_MODE_ENABLED) then
        return true
    end
    return __TS__ArrayIndexOf(self.commands, command) ~= -1
end
local Handler = __TS__New(CommandHandler)
____exports.Handler = Handler
return ____exports
