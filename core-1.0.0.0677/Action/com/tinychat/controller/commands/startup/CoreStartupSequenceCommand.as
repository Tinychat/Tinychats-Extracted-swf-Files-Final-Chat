package com.tinychat.controller.commands.startup
{
    import com.tinychat.controller.commands.chat.*;
    import com.tinychat.controller.commands.security.*;
    import com.tinychat.controller.commands.social.chat.*;
    import com.tinychat.controller.commands.social.network.facebook.*;
    import com.tinychat.controller.commands.social.network.twitter.*;
    import org.robotlegs.utilities.macrobot.*;

    public class CoreStartupSequenceCommand extends SequenceCommand
    {

        public function CoreStartupSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            commandMap.execute(FacebookInitSequenceCommand);
            commandMap.execute(TwitterInitCommand);
            commandMap.execute(LoadLinkValidatorsCommand);
            var _loc_1:* = new ParallelCommand();
            _loc_1.addCommand(AllowPageDomainCommand);
            _loc_1.addCommand(CoreStartupCommand);
            _loc_1.addCommand(RegisterTinychatChatListenersCommand);
            _loc_1.addCommand(SettingsOverrideCommand);
            _loc_1.addCommand(SetMicrophoneCodecCommand);
            _loc_1.addCommand(AntiDdosCommand);
            addCommandInstance(_loc_1);
            addCommand(TriggerModeStartupSequenceCommand);
            super.execute();
            return;
        }// end function

    }
}
