package com.tinychat.controller.commands.social.network.facebook.signals
{
    import com.tinychat.model.signals.*;

    public class SendFacebookInviteFriends extends AbstractReadOnlySignal
    {

        public function SendFacebookInviteFriends()
        {
            return;
        }// end function

        public function dispatch() : void
        {
            signal.dispatch();
            return;
        }// end function

    }
}
