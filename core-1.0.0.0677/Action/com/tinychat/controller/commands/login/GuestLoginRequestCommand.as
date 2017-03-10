package com.tinychat.controller.commands.login
{
    import com.tinychat.controller.commands.social.network.facebook.signals.*;
    import com.tinychat.model.login.*;
    import org.robotlegs.utilities.macrobot.*;

    public class GuestLoginRequestCommand extends AsyncCommand
    {
        public var promptFacebookInviteStatus:PromptFacebookInviteStatus;
        private var args:Object;
        private var guestLogin:GuestLogin;

        public function GuestLoginRequestCommand(param1:GuestLogin, param2:Object)
        {
            this.args = param2;
            this.guestLogin = param1;
            return;
        }// end function

        override public function execute() : void
        {
            this.guestLogin.login(this.args);
            this.promptFacebookInviteStatus.dispatch();
            dispatchComplete(true);
            return;
        }// end function

    }
}
