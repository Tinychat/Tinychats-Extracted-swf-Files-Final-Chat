package com.tinychat.controller.commands.social.network.facebook
{
    import com.facebook.graph.*;
    import com.facebook.graph.data.*;
    import com.tinychat.model.social.network.facebook.*;
    import org.robotlegs.utilities.macrobot.*;

    public class ConnectFacebookXmppSocketCommand extends AsyncCommand
    {
        public var socket:FacebookXmppSocket;

        public function ConnectFacebookXmppSocketCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = Facebook.getAuthResponse();
            this.socket.connect(_loc_1.uid, _loc_1.accessToken);
            dispatchComplete(true);
            return;
        }// end function

    }
}
