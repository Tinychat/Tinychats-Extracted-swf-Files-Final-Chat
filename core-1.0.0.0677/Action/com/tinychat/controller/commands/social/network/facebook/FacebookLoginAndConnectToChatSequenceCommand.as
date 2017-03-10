package com.tinychat.controller.commands.social.network.facebook
{
    import org.robotlegs.utilities.macrobot.*;

    public class FacebookLoginAndConnectToChatSequenceCommand extends SequenceCommand
    {

        public function FacebookLoginAndConnectToChatSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            atomic = false;
            addCommand(FacebookLoginSequenceCommand);
            addCommand(PostFacebookInviteStatusCommand);
            addCommand(SendFacebookInviteFriendsCommand);
            super.execute();
            return;
        }// end function

    }
}
