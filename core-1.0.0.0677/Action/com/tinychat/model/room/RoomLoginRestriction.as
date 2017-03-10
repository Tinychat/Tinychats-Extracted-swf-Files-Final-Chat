package com.tinychat.model.room
{

    public class RoomLoginRestriction extends Object
    {
        private var value:String;
        private var level:uint;
        public static const ANY:RoomLoginRestriction = new RoomLoginRestriction(ANY, "any", 0);
        public static const NON_GUEST:RoomLoginRestriction = new RoomLoginRestriction(NON_GUEST, "nonGuest", 1);
        public static const FACEBOOK:RoomLoginRestriction = new RoomLoginRestriction(FACEBOOK, "facebook", 3);
        public static const TUMBLR:RoomLoginRestriction = new RoomLoginRestriction(TUMBLR, "tumblr", 3);
        public static const TWITTER:RoomLoginRestriction = new RoomLoginRestriction(TWITTER, "twitter", 3);
        public static const FACEBOOK_AND_TUMBLR:RoomLoginRestriction = new RoomLoginRestriction(FACEBOOK_AND_TUMBLR, "facebookAndTumblr", 2);
        public static const FACEBOOK_AND_TWITTER:RoomLoginRestriction = new RoomLoginRestriction(FACEBOOK_AND_TWITTER, "facebookAndTwitter", 2);
        public static const TUMBLR_AND_TWITTER:RoomLoginRestriction = new RoomLoginRestriction(TUMBLR_AND_TWITTER, "tumblrAndTwitter", 2);

        public function RoomLoginRestriction(param1:RoomLoginRestriction, param2:String, param3:uint)
        {
            this.value = param2;
            this.level = param3;
            return;
        }// end function

        public function get isSingleLogin() : Boolean
        {
            return this.level == 3;
        }// end function

        public function moreRestrictiveThan(param1:RoomLoginRestriction) : Boolean
        {
            return this.level > param1.level;
        }// end function

        public function lessRestrictiveThan(param1:RoomLoginRestriction) : Boolean
        {
            return this.level < param1.level;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

    }
}
