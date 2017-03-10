package com.tinychat.ui.mediators.login.tumblr
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.social.network.tumblr.*;
    import com.tinychat.ui.components.login.tumblr.*;
    import com.tinychat.ui.mediators.login.*;

    public class TumblrLoginScreenMediator extends SocialNetworkLoginScreenMediator
    {

        public function TumblrLoginScreenMediator(param1:TumblrLoginScreen, param2:TumblrLogin)
        {
            super(param1, param2, LoginType.TUMBLR);
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.title = "Connect using Tumblr";
            view.loadingMessage = "Connecting to Tumblr, may take up to 20 seconds...";
            view.failureMessage = "Unable to connect to Tumblr.";
            return;
        }// end function

    }
}
