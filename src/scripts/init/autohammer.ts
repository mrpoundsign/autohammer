import { Commands, Command } from "../systems/command";
import { HudUI } from "../ui/hud";

class AutoHammerInit {
    constructor() {
        Commands.commands.set("/hammer", new Command("hammer", "// Hammer", (player: Entity, content: Array<string>) => {
            const chat = UIManager.get<HudUI>("Hud").chat;
            chat.receive("AutoHammer Reporting In For Duty!");
        }));
    }
}

export const AutoHammer = new AutoHammerInit();