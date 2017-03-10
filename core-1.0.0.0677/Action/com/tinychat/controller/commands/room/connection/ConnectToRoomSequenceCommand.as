package com.tinychat.controller.commands.room.connection
{
    import com.tinychat.controller.commands.room.captcha.*;
    import com.tinychat.controller.commands.room.connection.callbacks.*;
    import com.tinychat.controller.commands.room.ticket.*;
    import com.tinychat.controller.commands.social.network.facebook.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.commands.user.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.flashvars.*;
    import org.robotlegs.utilities.macrobot.*;

    public class ConnectToRoomSequenceCommand extends SequenceCommand
    {
        public var flashvars:FlashvarsProxy;

        public function ConnectToRoomSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            atomic = false;
            addCommand(TriggerStateActionCommand, StateAction.CONNECTION_ATTEMPT, StateAction);
            addCommand(PromotedVerificationCommand);
            addCommand(AutoOpVerificationCommand);
            addCommand(LoadChatTicketCommand);
            addCommand(ConnectToRoomCommand);
            addCommand(LoadChatCaptchaCommand);
            addCommand(UpdateNickCommand);
            addCommand(JoinsdoneCommand);
            if (this.flashvars.fbauto)
            {
                addCommand(FacebookAutoLoginCommand);
            }
            else
            {
                addCommand(TriggerStateActionCommand, StateAction.CONNECTION_ATTEMPT_SUCCESS, StateAction);
            }
            super.execute();
            return;
        }// end function

    }
}
