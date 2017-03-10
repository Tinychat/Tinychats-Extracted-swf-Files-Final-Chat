package com.tinychat.services.chat.tinychat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.parsers.privatemessage.*;
    import com.tinychat.model.parsers.privatemessage.arguments.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.social.chat.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.chat.spam.*;
    import com.tinychat.services.chat.*;
    import com.tinychat.ui.components.social.chat.*;
    import org.osflash.signals.*;

    public class TinychatChatServiceBase extends Object implements ChatService
    {
        protected var colors:ChatColors;
        private var sender:PrivateMessageSender;
        private var parser:PrivateMessageParser;
        private var type:String;
        private var _received:ChatReceived;
        static const PUBLIC:String = "public";
        static const PRIVATE:String = "private";

        public function TinychatChatServiceBase(param1:String, param2:PrivateMessageSender, param3:PrivateMessageParser, param4:ChatColors)
        {
            this.type = param1;
            this.sender = param2;
            this.parser = param3;
            this.colors = param4;
            this._received = new ChatReceived();
            if (param1 == PUBLIC)
            {
                param3.publicChat.add(this.chatHandler);
            }
            else
            {
                param3.privateChat.add(this.chatHandler);
            }
            return;
        }// end function

        public function get received() : ISignal
        {
            return this._received;
        }// end function

        public function get maximumMessageLength() : uint
        {
            return 90;
        }// end function

        public function send(param1:String, param2:UserIdentity) : void
        {
            this.sender.send(param1, param2, this.colors.current);
            return;
        }// end function

        private function chatHandler(param1:PrivateMessageChatArguments) : void
        {
            if (param1.message != "")
            {
                this.messageReceivedHandler(param1.sender, param1.message, param1.color);
            }
            return;
        }// end function

        private function messageReceivedHandler(param1:User, param2:String, param3:uint) : void
        {
            if (StandardChatColors.COLORS.indexOf(param3) == -1)
            {
                if (param1.pro)
                {
                }
            }
            if (ProChatColors.COLORS.indexOf(param3) == -1)
            {
                param3 = 0;
            }
            param2 = MessageSanitizer.sanitize(param2);
            this._received.dispatch(new TinychatUserChatMessage(param1, param2, param3), param1);
            return;
        }// end function

    }
}
