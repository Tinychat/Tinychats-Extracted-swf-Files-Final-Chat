package com.tinychat.controller.commands.login
{
    import com.tinychat.controller.commands.trial.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.flashvars.*;
    import org.robotlegs.mvcs.*;

    public class LoginSuccessCommand extends Command
    {
        public var user:UserIdentity;
        public var flashvars:FlashvarsProxy;

        public function LoginSuccessCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            commandMap.execute(TrialPopupCountdownCommand);
            return;
        }// end function

    }
}
