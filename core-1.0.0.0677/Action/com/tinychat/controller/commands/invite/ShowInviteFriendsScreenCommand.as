package com.tinychat.controller.commands.invite
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.controller.commands.social.network.facebook.signals.*;
    import com.tinychat.controller.guards.login.*;
    import com.tinychat.ui.components.login.facebook.*;
    import com.tinychat.ui.screensequence.*;

    public class ShowInviteFriendsScreenCommand extends OpenScreenSequenceContainerCommand
    {
        public var sendFacebookInviteFriends:SendFacebookInviteFriends;

        public function ShowInviteFriendsScreenCommand()
        {
            return;
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            param1.addScreen(FacebookLoginScreen, FacebookLoginRequestGuard);
            return;
        }// end function

        override public function execute() : void
        {
            super.execute();
            this.sendFacebookInviteFriends.dispatch();
            return;
        }// end function

    }
}
