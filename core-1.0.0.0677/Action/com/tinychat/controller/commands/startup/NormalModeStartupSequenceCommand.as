package com.tinychat.controller.commands.startup
{
    import com.tinychat.controller.commands.login.*;
    import com.tinychat.controller.commands.room.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.login.*;
    import org.robotlegs.utilities.macrobot.*;

    public class NormalModeStartupSequenceCommand extends SequenceCommand implements ModeStartupSequenceCommand
    {
        public var nickIsPredetermined:NickIsPredeterminedGuard;
        public var flashvars:FlashvarsProxy;

        public function NormalModeStartupSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            atomic = false;
            addCommand(LoadRoomInfoAndConnectSequenceCommand);
            if (this.nickIsPredetermined.approve())
            {
                addCommandInstance(new LoginRequestCommand(LoginType.GUEST, true, {name:this.flashvars.nick}));
            }
            else
            {
                addCommand(TriggerStateActionCommand, StateAction.PROMPT_LOGIN, StateAction);
            }
            super.execute();
            return;
        }// end function

    }
}
