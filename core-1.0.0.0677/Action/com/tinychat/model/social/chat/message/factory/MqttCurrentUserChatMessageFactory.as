package com.tinychat.model.social.chat.message.factory
{
    import com.tinychat.model.social.chat.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.network.mqtt.*;

    public class MqttCurrentUserChatMessageFactory extends Object implements CurrentUserChatMessageFactory
    {
        private var mqttProxy:MqttProxy;
        private var colors:ChatColors;

        public function MqttCurrentUserChatMessageFactory(param1:MqttProxy, param2:ChatColors)
        {
            this.mqttProxy = param1;
            this.colors = param2;
            return;
        }// end function

        public function create(param1:String) : AbstractUserChatMessage
        {
            return new MqttUserChatMessage(this.mqttProxy.currentUser as MqttUser, param1, this.colors.current);
        }// end function

    }
}
