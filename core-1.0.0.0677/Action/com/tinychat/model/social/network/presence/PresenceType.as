package com.tinychat.model.social.network.presence
{

    public class PresenceType extends Object
    {
        private var value:String;
        private static var valueLookup:Object = {};
        public static const AWAY:PresenceType = new PresenceType(AWAY, "away");
        public static const OFFLINE:PresenceType = new PresenceType(OFFLINE, "offline");
        public static const ONLINE:PresenceType = new PresenceType(ONLINE, "online");

        public function PresenceType(param1:PresenceType, param2:String)
        {
            this.value = param2;
            valueLookup[param2] = this;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

        public static function fromValue(param1:String) : PresenceType
        {
            return valueLookup.hasOwnProperty(param1) ? (valueLookup[param1]) : (OFFLINE);
        }// end function

    }
}
