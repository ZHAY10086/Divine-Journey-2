#loader crafttweaker reloadable

// Author: WaitingIdly

import crafttweaker.server.IServer;
import crafttweaker.player.IPlayer;
import crafttweaker.text.ITextComponent;
import mods.zenutils.command.ZenCommand;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;
import mods.zenutils.command.ZenCommandTree;
import mods.zenutils.command.ZenUtilsCommandSender;



static links as string[][string] = {
    curseforge: ["commands.curseforge.text", "https://www.curseforge.com/minecraft/modpacks/divine-journey-2"],
    discord: ["commands.discord.text", "https://discord.gg/rH9pyS7"],
    issues: ["commands.issues.text", "https://github.com/Divine-Journey-2/Divine-Journey-2/issues"],
} as string[][string];



function printToTarget(server as IServer, sender as ZenUtilsCommandSender, args as string[], type as string) {
    var target as IPlayer;
    if (args.length == 1) {
        target = CommandUtils.getPlayer(server, sender, args[0]);
    } else {
        target = CommandUtils.getCommandSenderAsPlayer(sender);
    }
    if (isNull(target)) {
        // :(
    } else {
        target.sendRichTextMessage(
            ITextComponent.fromData({
                "text": ITextComponent.fromTranslation(links[type][0]).unformattedText,
                "underlined": true,
                "color": "blue",
                "clickEvent": {
                    "action": "open_url",
                    "value": links[type][1]
                }
            })
        );
    }
}

val curseforge as ZenCommand = ZenCommand.create("curseforge");
val discord as ZenCommand = ZenCommand.create("discord");
val issues as ZenCommand = ZenCommand.create("issues");
val bugs as ZenCommand = ZenCommand.create("bugs");
curseforge.getCommandUsage = function(sender) { return "commands.curseforge.usage"; };
discord.getCommandUsage = function(sender) { return "commands.discord.usage"; };
issues.getCommandUsage = function(sender) { return "commands.issues.usage"; };
bugs.getCommandUsage = function(sender) { return "commands.issues.usage"; };
curseforge.requiredPermissionLevel = 0;
discord.requiredPermissionLevel = 0;
issues.requiredPermissionLevel = 0;
bugs.requiredPermissionLevel = 0;
curseforge.execute = function(command, server, sender, args) { printToTarget(server, sender, args, "curseforge"); };
discord.execute = function(command, server, sender, args) { printToTarget(server, sender, args, "discord"); };
issues.execute = function(command, server, sender, args) { printToTarget(server, sender, args, "issues"); };
bugs.execute = function(command, server, sender, args) { printToTarget(server, sender, args, "issues"); };
curseforge.register();
discord.register();
issues.register();
bugs.register();

val book_of_logic as ZenCommand = ZenCommand.create("book_of_logic");
book_of_logic.getCommandUsage = function(sender) { return "commands.book_of_logic.usage"; };
book_of_logic.requiredPermissionLevel = 0;
book_of_logic.execute = function(command, server, sender, args) {
    val target as IPlayer = CommandUtils.getCommandSenderAsPlayer(sender);
    if (isNull(target)) {
        // :(
    } else {
        target.sendRichTextMessage(ITextComponent.fromData({
            "text": (game.localize("dj2.book_of_logic.desc0") + "\n" +
                    game.localize("dj2.book_of_logic.desc1") + "\n" +
                    game.localize("dj2.book_of_logic.desc2") + "\n" +
                    game.localize("dj2.book_of_logic.desc3") + "\n" +
                    game.localize("dj2.book_of_logic.desc4") + "\n" +
                    game.localize("dj2.book_of_logic.desc5") + "\n" +
                    game.localize("dj2.book_of_logic.desc6")).replace("\\n", "\n").replace("\n\n", "\n")
        }));
    }
};
book_of_logic.register();

val introduction_book as ZenCommand = ZenCommand.create("introduction_book");
introduction_book.getCommandUsage = function(sender) { return "commands.introduction_book.usage"; };
introduction_book.requiredPermissionLevel = 0;
introduction_book.execute = function(command, server, sender, args) {
    val target as IPlayer = CommandUtils.getCommandSenderAsPlayer(sender);
    if (isNull(target)) {
        // :(
    } else {
        target.sendRichTextMessage(ITextComponent.fromData({
            "text": (game.localize("dj2.introduction.book.desc0") + "\n" +
                    game.localize("dj2.introduction.book.desc1") + "\n" +
                    game.localize("dj2.introduction.book.desc2") + "\n" +
                    game.localize("dj2.introduction.book.desc3") + "\n" +
                    game.localize("dj2.introduction.book.desc4") + "\n" +
                    game.localize("dj2.introduction.book.desc5") + "\n" +
                    game.localize("dj2.introduction.book.desc6") + "\n" +
                    game.localize("dj2.introduction.book.desc7") + "\n" +
                    game.localize("dj2.introduction.book.desc8") + "\n" +
                    game.localize("dj2.introduction.book.desc9") + "\n" +
                    game.localize("dj2.introduction.book.desc10")).replace("\\n", "\n").replace("\n\n", "\n")
        }));
    }
};
introduction_book.register();



ZenCommandTree.create("dj2", curseforge, discord, issues, bugs, book_of_logic, introduction_book).register();
