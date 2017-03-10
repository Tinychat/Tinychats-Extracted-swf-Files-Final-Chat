package com.tinychat.model.room.connection.calls
{

    public class RoomCallMethodNames extends Object
    {
        public static const ACCOUNT:String = "account";
        public static const BAN:String = "kick";
        public static const BANLIST:String = "banlist";
        public static const BROADCAST_AUTHENTICATION:String = "bauth";
        public static const FORGIVE:String = "forgive";
        public static const NICK:String = "nick";
        public static const OWNER_RUN:String = "owner_run";
        public static const PRIVATE_ROOM:String = "private_room";
        public static const PRIVMSG:String = "privmsg";
        public static const PRO:String = "pro";
        public static const TOPIC:String = "topic";
        public static const PREPARE_GIFT:String = "prepare_gift";
        public static const toArray:Array = [NICK, PRIVMSG];

        public function RoomCallMethodNames()
        {
            return;
        }// end function

    }
}
