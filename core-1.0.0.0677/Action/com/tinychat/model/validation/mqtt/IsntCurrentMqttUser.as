package com.tinychat.model.validation.mqtt
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.mqtt.*;

    public class IsntCurrentMqttUser extends Object implements IsntCurrentSocialNetworkUser
    {
        private var mqttProxy:MqttProxy;

        public function IsntCurrentMqttUser(param1:MqttProxy)
        {
            this.mqttProxy = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            return this.mqttProxy.currentUser.id != param1.id;
        }// end function

    }
}
