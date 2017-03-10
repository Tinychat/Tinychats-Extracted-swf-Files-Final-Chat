package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.controller.commands.social.network.facebook.signals.*;
    import com.tinychat.ui.components.login.facebook.*;
    import com.tinychat.ui.screensequence.*;

    public class DisplayFacebookAutoLoginCommand extends OpenScreenSequenceContainerCommand
    {
        public var sendFacebookInviteFriends:SendFacebookInviteFriends;

        public function DisplayFacebookAutoLoginCommand()
        {
            super(false, true);
            return;
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            param1.addScreen(FacebookLoginScreen);
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
