package com.tinychat.services.vo
{

    public class RoomAccess extends Object
    {
        private var value:String;
        public static const BLOCKED:RoomAccess = new RoomAccess(BLOCKED, "blocked");
        public static const CLOSED:RoomAccess = new RoomAccess(CLOSED, "closed");
        public static const DOMAIN_BLOCK:RoomAccess = new RoomAccess(DOMAIN_BLOCK, "domainBlock");
        public static const OK:RoomAccess = new RoomAccess(OK, "ok");
        public static const PASSWORD_PROTECTED:RoomAccess = new RoomAccess(PASSWORD_PROTECTED, "passwordProtected");
        public static const UNKNOWN:RoomAccess = new RoomAccess(UNKNOWN, "unknown");

        public function RoomAccess(param1:RoomAccess, param2:String)
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
