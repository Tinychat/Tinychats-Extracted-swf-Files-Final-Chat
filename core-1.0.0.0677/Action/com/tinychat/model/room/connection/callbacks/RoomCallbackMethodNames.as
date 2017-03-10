package com.tinychat.model.room.connection.callbacks
{
    import __AS3__.vec.*;

    public class RoomCallbackMethodNames extends Object
    {
        public static const ACCOUNT:String = "account";
        public static const AVON:String = "avon";
        public static const AVOFF:String = "avoff";
        public static const AVONS:String = "avons";
        public static const BANLIST:String = "banlist";
        public static const BANNED:String = "banned";
        public static const DEOP:String = "deop";
        public static const FROM_OWNER:String = "from_owner";
        public static const JOIN:String = "join";
        public static const JOINS:String = "joins";
        public static const JOINSDONE:String = "joinsdone";
        public static const KICK:String = "kick";
        public static const NICK:String = "nick";
        public static const NICK_IN_USE:String = "nick_in_use";
        public static const NOTICE:String = "notice";
        public static const ON_STATUS:String = "onStatus";
        public static const OPER:String = "oper";
        public static const PART:String = "part";
        public static const PING:String = "ping";
        public static const PRIVATE_ROOM:String = "private_room";
        public static const PRIVMSG:String = "privmsg";
        public static const PRO:String = "pro";
        public static const PROS:String = "pros";
        public static const QUIT:String = "quit";
        public static const REGISTERED:String = "registered";
        public static const STARTBANLIST:String = "startbanlist";
        public static const TOPIC:String = "topic";
        public static const VIEWCOUNT:String = "viewcount";
        public static const GIFT:String = "gift";
        public static const GIFT_PROFILE:String = "prepare_gift_profile";
        public static const all:Vector.<String> = RoomCallbackMethodNames.Vector.<String>([BANLIST, BANNED, DEOP, FROM_OWNER, JOIN, JOINS, JOINSDONE, KICK, NICK, NICK_IN_USE, NOTICE, ON_STATUS, OPER, PART, PING, PRIVATE_ROOM, PRIVMSG, QUIT, REGISTERED, STARTBANLIST, TOPIC, GIFT, GIFT_PROFILE]);

        public function RoomCallbackMethodNames()
        {
            return;
        }// end function

    }
}
