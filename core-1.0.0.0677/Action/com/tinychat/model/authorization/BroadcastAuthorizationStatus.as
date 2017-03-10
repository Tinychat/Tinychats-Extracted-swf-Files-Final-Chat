package com.tinychat.model.authorization
{

    public class BroadcastAuthorizationStatus extends Object
    {
        private var value:String;
        public static const AUTHORIZED:BroadcastAuthorizationStatus = new BroadcastAuthorizationStatus(AUTHORIZED, "authorized");
        public static const BLOCKED:BroadcastAuthorizationStatus = new BroadcastAuthorizationStatus(BLOCKED, "blocked");
        public static const PASSWORD_PROTECTED:BroadcastAuthorizationStatus = new BroadcastAuthorizationStatus(PASSWORD_PROTECTED, "password_protected");
        public static const UNKNOWN:BroadcastAuthorizationStatus = new BroadcastAuthorizationStatus(UNKNOWN, "unknown");

        public function BroadcastAuthorizationStatus(param1:BroadcastAuthorizationStatus, param2:String)
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
