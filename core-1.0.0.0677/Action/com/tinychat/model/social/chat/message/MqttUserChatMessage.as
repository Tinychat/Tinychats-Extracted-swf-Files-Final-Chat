package com.tinychat.model.social.chat.message
{
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.model.social.network.presence.*;
    import org.osflash.signals.*;

    public class MqttUserChatMessage extends AbstractUserChatMessage implements MqttUser
    {
        private var user:MqttUser;

        public function MqttUserChatMessage(param1:MqttUser, param2:String, param3:uint)
        {
            this.user = param1;
            super(param1, param2, param3);
            return;
        }// end function

        public function get subscribedChanged() : ISignal
        {
            return this.user.subscribedChanged;
        }// end function

        public function get blockedChanged() : ISignal
        {
            return this.user.blockedChanged;
        }// end function

        public function get subscribed() : Boolean
        {
            return this.user.subscribed;
        }// end function

        public function get blocked() : Boolean
        {
            return this.user.blocked;
        }// end function

        public function get presence() : PresenceType
        {
            return this.user.presence;
        }// end function

        public function get presenceChanged() : ISignal
        {
            return this.user.presenceChanged;
        }// end function

    }
}
