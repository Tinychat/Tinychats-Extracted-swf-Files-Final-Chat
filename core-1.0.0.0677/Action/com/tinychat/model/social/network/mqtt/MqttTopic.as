package com.tinychat.model.social.network.mqtt
{

    public class MqttTopic extends Object
    {
        private var _type:String;
        private var _args:Array;
        public static const INVALID:String = "invalid";
        public static const MESSAGE_FROM_USER:String = "messageFromUser";
        public static const ONLINE_OFFLINE_PRESENCE_UPDATE:String = "onlineOfflinePresenceUpdate";
        public static const USER:String = "user";
        public static const USER_PRESENCE_UPDATE:String = "userPresenceUpdate";
        public static const USER_BLOCKED:String = "userBlocked";
        public static const USER_UNBLOCKED:String = "userUnblocked";

        public function MqttTopic(param1:String, ... args)
        {
            this._type = param1;
            this._args = args;
            return;
        }// end function

        public function get type() : String
        {
            return this._type;
        }// end function

        public function get args() : Array
        {
            return this._args;
        }// end function

    }
}
