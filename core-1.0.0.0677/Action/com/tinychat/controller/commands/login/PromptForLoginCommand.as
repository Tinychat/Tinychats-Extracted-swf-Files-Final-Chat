package com.tinychat.controller.commands.login
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.controller.guards.login.*;
    import com.tinychat.model.guards.mode.*;
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.components.login.facebook.*;
    import com.tinychat.ui.components.login.tumblr.*;
    import com.tinychat.ui.components.login.twitter.*;
    import com.tinychat.ui.screensequence.*;

    public class PromptForLoginCommand extends OpenScreenSequenceContainerCommand
    {
        private static var executedOnce:Boolean = false;

        public function PromptForLoginCommand()
        {
            super(false);
            return;
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            param1.addScreen(LoginSelectorScreen);
            param1.addScreen(FacebookLoginScreen, FacebookLoginRequestGuard);
            param1.addScreen(TumblrLoginScreen, TumblrLoginRequestGuard);
            param1.addScreen(TumblrLoginSuccessScreen, TumblrLoginRequestGuard, IsntNextModeGuard);
            param1.addScreen(TwitterLoginScreen, TwitterLoginRequestGuard);
            param1.addScreen(TwitterLoginSuccessScreen, TwitterLoginRequestGuard, IsntNextModeGuard);
            return;
        }// end function

        override protected function completedHandler() : void
        {
            super.completedHandler();
            executedOnce = true;
            return;
        }// end function

    }
}
