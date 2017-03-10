package com.tinychat.services.chat.facebook
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.services.chat.*;
    import org.osflash.signals.*;

    public class FacebookChatService extends Object implements ChatService
    {
        private var socket:FacebookXmppSocket;
        private var loginProxy:FacebookLoginProxy;
        private var friends:FacebookFriendsProxy;
        private var _received:ChatReceived;

        public function FacebookChatService(param1:FacebookXmppSocket, param2:FacebookLoginProxy, param3:FacebookFriendsProxy)
        {
            this.socket = param1;
            this.loginProxy = param2;
            this.friends = param3;
            this._received = new ChatReceived();
            param1.message.add(this.messageHandler);
            return;
        }// end function

        public function get received() : ISignal
        {
            return this._received;
        }// end function

        public function get maximumMessageLength() : uint
        {
            return 512;
        }// end function

        public function send(param1:String, param2:UserIdentity) : void
        {
            var _loc_3:* = this.loginProxy.facebookUser;
            var _loc_4:* = "<message from=\"-" + _loc_3.id + "@chat.facebook.com\" to=\"-" + param2.id + "@chat.facebook.com\" type=\"chat\"><body>" + param1 + "</body><active xmlns=\"http://jabber.org/protocol/chatstates\" /></message>";
            this.socket.send(_loc_4);
            return;
        }// end function

        private function messageHandler(param1:XML) : void
        {
            var user:FacebookUser;
            var node:* = param1;
            var parseIdFrom:* = function (param1:XML) : String
            {
                var _loc_2:* = param1.@from;
                return _loc_2.substr(1, (_loc_2.indexOf("@") - 1));
            }// end function
            ;
            var id:* = this.parseIdFrom(node);
            var message:* = node.body;
            if (message != "")
            {
                user = this.friends.getFriendByIdString(id);
                this._received.dispatch(new FacebookUserChatMessage(user, message, 3889560), user);
            }
            return;
        }// end function

    }
}
