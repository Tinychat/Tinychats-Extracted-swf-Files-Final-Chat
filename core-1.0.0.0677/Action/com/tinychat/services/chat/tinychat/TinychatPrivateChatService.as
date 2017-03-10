package com.tinychat.services.chat.tinychat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.parsers.privatemessage.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.social.chat.*;

    public class TinychatPrivateChatService extends TinychatChatServiceBase implements ChatService
    {

        public function TinychatPrivateChatService(param1:PrivateMessageSender, param2:PrivateMessageParser, param3:ChatColors)
        {
            super(PRIVATE, param1, param2, param3);
            return;
        }// end function

        override public function send(param1:String, param2:UserIdentity) : void
        {
            var _loc_3:* = "/msg " + param2.name + " " + param1;
            super.send(_loc_3, param2);
            return;
        }// end function

    }
}
