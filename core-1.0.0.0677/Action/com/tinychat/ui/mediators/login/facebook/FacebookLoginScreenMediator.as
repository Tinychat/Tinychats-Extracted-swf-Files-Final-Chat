package com.tinychat.ui.mediators.login.facebook
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.ui.components.login.facebook.*;
    import com.tinychat.ui.mediators.login.*;

    public class FacebookLoginScreenMediator extends SocialNetworkLoginScreenMediator
    {

        public function FacebookLoginScreenMediator(param1:FacebookLoginScreen, param2:FacebookLoginProxy)
        {
            super(param1, param2, LoginType.FACEBOOK);
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.title = "Connect using Facebook";
            view.loadingMessage = "Connecting to Facebook...";
            view.failureMessage = "Unable to connect to Facebook.";
            return;
        }// end function

    }
}
