package com.tinychat.model.social.network.mqtt
{

    public class MqttVisibility extends Object
    {
        private var value:String;
        public static const ALL:MqttVisibility = new MqttVisibility(ALL, "all");
        public static const FRIENDS:MqttVisibility = new MqttVisibility(FRIENDS, "friends");
        public static const NONE:MqttVisibility = new MqttVisibility(NONE, "none");

        public function MqttVisibility(param1:MqttVisibility, param2:String)
        {
            this.value = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

    }
}
