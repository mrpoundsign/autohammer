import { settingkeys } from "../../ui/settings";

class CommandHandler {

  commands: Array<string> = [
    "help",
  ]

  constructor() {
    log.info("CommandHandler constructor");
  }

  Enable(command: string) {
    this.commands.indexOf(command) === -1 ? this.commands.push(command) : null;
  }

  Disable(command: string) {
    this.commands.indexOf(command) !== -1 ? this.commands.splice(this.commands.indexOf(command), 1) : null;
  }

  IsEnabled(command: string): boolean {
    log.info("IsEnabled:" + command + ":" + (this.commands.indexOf(command) !== -1));
    if (settings.getBool(settingkeys.DEBUGGING_MODE_ENABLED)) {
      return true;
    }

    return this.commands.indexOf(command) !== -1;
  }
}

const Handler = new CommandHandler();

export { Handler };