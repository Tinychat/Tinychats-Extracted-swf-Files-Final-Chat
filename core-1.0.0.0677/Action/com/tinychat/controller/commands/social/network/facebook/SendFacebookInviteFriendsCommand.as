package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.services.social.network.facebook.share.*;
    import org.robotlegs.mvcs.*;

    public class SendFacebookInviteFriendsCommand extends Command
    {
        public var flashvars:FlashvarsProxy;
        public var facebookLogin:FacebookLoginProxy;
        private var service:FacebookSendInviteStatusService;

        public function SendFacebookInviteFriendsCommand(param1:FacebookSendInviteStatusService)
        {
            this.service = param1;
            return;
        }// end function

        override public function execute() : void
        {
            if (this.facebookLogin)
            {
            }
            if (this.facebookLogin.isLoggedIn)
            {
                this.service.post();
            }
            return;
        }// end function

    }
}
