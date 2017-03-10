package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.model.social.network.facebook.*;
    import org.robotlegs.utilities.macrobot.*;

    public class ConnectToFacebookChatSequenceCommand extends SequenceCommand
    {
        public var chat:FacebookXmppSocket;
        public var permissions:FacebookPermissions;

        public function ConnectToFacebookChatSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.chat.isConnected)
            {
                dispatchComplete(true);
            }
            else
            {
                injector.getInstance(FacebookFriendsProxy);
                atomic = false;
                addCommandInstance(new VerifyFacebookSessionCommand(this.permissions, [FacebookPermissions.XMPP_LOGIN], 0));
                addCommand(FacebookLoadFriendsCommand);
                addCommand(ConnectFacebookXmppSocketCommand);
                addCommand(RegisterFacebookChatListenersCommand);
                super.execute();
            }
            return;
        }// end function

    }
}
