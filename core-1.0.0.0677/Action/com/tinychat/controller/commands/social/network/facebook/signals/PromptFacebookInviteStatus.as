package com.tinychat.controller.commands.social.network.facebook.signals
{
    import com.tinychat.model.signals.*;

    public class PromptFacebookInviteStatus extends AbstractReadOnlySignal
    {

        public function PromptFacebookInviteStatus()
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
