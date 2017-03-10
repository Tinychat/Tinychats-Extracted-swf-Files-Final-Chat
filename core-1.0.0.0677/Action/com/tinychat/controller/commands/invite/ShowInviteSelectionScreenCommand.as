package com.tinychat.controller.commands.invite
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.controller.guards.login.*;
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.components.login.facebook.*;
    import com.tinychat.ui.components.login.tumblr.*;
    import com.tinychat.ui.components.login.twitter.*;
    import com.tinychat.ui.screensequence.*;

    public class ShowInviteSelectionScreenCommand extends OpenScreenSequenceContainerCommand
    {

        public function ShowInviteSelectionScreenCommand()
        {
            return;
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            param1.addScreen(InviteSelectionScreen);
            param1.addScreen(FacebookLoginScreen, FacebookLoginRequestGuard);
            param1.addScreen(TumblrLoginScreen, TumblrLoginRequestGuard);
            param1.addScreen(TumblrLoginSuccessScreen, TumblrLoginRequestGuard);
            param1.addScreen(TwitterLoginScreen, TwitterLoginRequestGuard);
            param1.addScreen(TwitterLoginSuccessScreen, TwitterLoginRequestGuard);
            return;
        }// end function

    }
}
