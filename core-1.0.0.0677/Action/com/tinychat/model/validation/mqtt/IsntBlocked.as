package com.tinychat.model.validation.mqtt
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.mqtt.*;

    public class IsntBlocked extends Object implements IdentityValidation
    {
        private var mqttProxy:MqttProxy;

        public function IsntBlocked(param1:MqttProxy)
        {
            this.mqttProxy = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            var _loc_2:* = this.mqttProxy.getFriend(param1.id);
            if (_loc_2)
            {
            }
            return !_loc_2.blocked;
        }// end function

    }
}
