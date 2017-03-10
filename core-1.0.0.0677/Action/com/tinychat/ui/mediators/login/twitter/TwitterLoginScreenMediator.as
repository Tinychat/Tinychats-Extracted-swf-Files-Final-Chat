package com.tinychat.ui.mediators.login.twitter
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.social.network.twitter.*;
    import com.tinychat.ui.components.login.twitter.*;
    import com.tinychat.ui.mediators.login.*;

    public class TwitterLoginScreenMediator extends SocialNetworkLoginScreenMediator
    {

        public function TwitterLoginScreenMediator(param1:TwitterLoginScreen, param2:TwitterProxy)
        {
            super(param1, param2, LoginType.TWITTER);
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.title = "Connect using Twitter";
            view.loadingMessage = "Connecting to Twitter, may take up to 20 seconds...";
            view.failureMessage = "Unable to connect to Twitter.";
            return;
        }// end function

    }
}
