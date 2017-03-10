package com.tinychat.services.chat.tinychat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.parsers.privatemessage.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.social.chat.*;

    public class TinychatPublicChatService extends TinychatChatServiceBase implements ChatService
    {

        public function TinychatPublicChatService(param1:PrivateMessageSender, param2:PrivateMessageParser, param3:ChatColors)
        {
            super(PUBLIC, param1, param2, param3);
            return;
        }// end function

        override public function send(param1:String, param2:UserIdentity) : void
        {
            super.send(param1, null);
            return;
        }// end function

    }
}
