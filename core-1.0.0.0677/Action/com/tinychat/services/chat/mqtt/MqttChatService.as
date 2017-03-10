package com.tinychat.services.chat.mqtt
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.chat.spam.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.services.chat.*;
    import org.osflash.signals.*;

    public class MqttChatService extends Object implements ChatService
    {
        private var proxy:MqttProxy;
        private var _received:ChatReceived;

        public function MqttChatService(param1:MqttProxy)
        {
            this.proxy = param1;
            this.proxy.messageReceived.add(this.messageReceivedHandler);
            this._received = new ChatReceived();
            return;
        }// end function

        public function get received() : ISignal
        {
            return this._received;
        }// end function

        public function get maximumMessageLength() : uint
        {
            return 256;
        }// end function

        public function send(param1:String, param2:UserIdentity) : void
        {
            this.proxy.sendMessage(param1, param2);
            return;
        }// end function

        private function messageReceivedHandler(param1:String, param2:MqttUser) : void
        {
            if (param1 != "")
            {
                param1 = MessageSanitizer.sanitize(param1);
                this._received.dispatch(new MqttUserChatMessage(param2, param1, 3889560), param2);
            }
            return;
        }// end function

    }
}
