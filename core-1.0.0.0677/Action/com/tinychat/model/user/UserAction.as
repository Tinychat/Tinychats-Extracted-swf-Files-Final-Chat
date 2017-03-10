package com.tinychat.model.user
{

    public class UserAction extends Object
    {
        private var _input:String;
        private var _name:String;
        private var _requiredArgCount:uint;
        public static const ALLOW_BROADCAST:UserAction = new UserAction(ALLOW_BROADCAST, "allowbroadcast", "/allowbroadcast", 1);
        public static const BAN:UserAction = new UserAction(BAN, "ban", "/ban", 1);
        public static const BANLIST:UserAction = new UserAction(BANLIST, "banlist", "/banlist");
        public static const BROADCAST:UserAction = new UserAction(BROADCAST, "broadcast", "/broadcast", 1);
        public static const CLOSE:UserAction = new UserAction(CLOSE, "close", "/close", 1);
        public static const COLOR:UserAction = new UserAction(COLOR, "color", "/color");
        public static const FORGIVE:UserAction = new UserAction(FORGIVE, "forgive", "/forgive", 1);
        public static const HELP:UserAction = new UserAction(HELP, "help", "/help");
        public static const IGNORE:UserAction = new UserAction(IGNORE, "ignore", "/ignore", 1);
        public static const INVALID:UserAction = new UserAction(INVALID, "invalid", "/invalid");
        public static const MUTE:UserAction = new UserAction(MUTE, "mute", "/mute");
        public static const NICK:UserAction = new UserAction(NICK, "nick", "/nick", 1);
        public static const OPER:UserAction = new UserAction(OPER, "oper", "/oper", 1);
        public static const PUBLIC_CHAT:UserAction = new UserAction(PUBLIC_CHAT, "public_chat", "");
        public static const PUSH2TALK:UserAction = new UserAction(PUSH2TALK, "push2talk", "/push2talk");
        public static const PRIVATE_CHAT:UserAction = new UserAction(PRIVATE_CHAT, "private_chat", "/msg", 2);
        public static const REPORTED:UserAction = new UserAction(REPORTED, "reported", "/reported");
        public static const USERINFO:UserAction = new UserAction(USERINFO, "userinfo", "/userinfo");
        public static const UNIGNORE:UserAction = new UserAction(UNIGNORE, "unignore", "/unignore", 1);
        public static const VERSION:UserAction = new UserAction(VERSION, "version", "/version");
        public static const VIDEO_FILTER:UserAction = new UserAction(VIDEO_FILTER, "videofilter", "/videofilter", 1);
        public static const MEDIA_BROADCAST_CLOSED:UserAction = new UserAction(MEDIA_BROADCAST_CLOSED, "mediaBroadcastClosed", "/mbc", 1);
        public static const MEDIA_BROADCAST_PAUSED:UserAction = new UserAction(MEDIA_BROADCAST_PAUSED, "mediaBroadcastPaused", "/mbpa", 1);
        public static const MEDIA_BROADCAST_PLAYED:UserAction = new UserAction(MEDIA_BROADCAST_PLAYED, "mediaBroadcastPlayed", "/mbpl", 2);
        public static const MEDIA_BROADCAST_SOUGHT:UserAction = new UserAction(MEDIA_BROADCAST_SOUGHT, "mediaBroadcastSought", "/mbsk", 2);
        public static const MEDIA_BROADCAST_STARTED:UserAction = new UserAction(MEDIA_BROADCAST_STARTED, "mediaBroadcastStarted", "/mbs", 3);
        public static const MEDIA_BROADCAST_STARTED_PAUSED:UserAction = new UserAction(MEDIA_BROADCAST_STARTED_PAUSED, "mediaBroadcastStartedPaused", "/mbsp", 3);

        public function UserAction(param1:UserAction, param2:String, param3:String, param4:uint = 0)
        {
            this._input = param3;
            this._name = param2;
            this._requiredArgCount = param4;
            return;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get input() : String
        {
            return this._input;
        }// end function

        public function get requiredArgCount() : uint
        {
            return this._requiredArgCount;
        }// end function

        public function toString() : String
        {
            return this._name;
        }// end function

    }
}
