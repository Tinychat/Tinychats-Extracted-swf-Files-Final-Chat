package com.tinychat.model.social.chat
{
    import flash.utils.*;

    public class Smiley extends Object
    {
        private var string:String;
        private var _group:SmileyGroup;
        private static var smileyMap:Dictionary = new Dictionary();
        public static const CONCERNED:Smiley = new Smiley(CONCERNED, ":/", SmileyGroup.CONCERNED);
        public static const CONCERNED_NOSE:Smiley = new Smiley(CONCERNED_NOSE, ":-/", SmileyGroup.CONCERNED);
        public static const CONFUSED:Smiley = new Smiley(CONFUSED, ":S", SmileyGroup.CONFUSED);
        public static const CONFUSED_NOSE:Smiley = new Smiley(CONFUSED_NOSE, ":-S", SmileyGroup.CONFUSED);
        public static const COOL:Smiley = new Smiley(COOL, "8)", SmileyGroup.COOL);
        public static const COOL_NOSE:Smiley = new Smiley(COOL_NOSE, "8-)", SmileyGroup.COOL);
        public static const FROWN:Smiley = new Smiley(FROWN, ":(", SmileyGroup.FROWN);
        public static const FROWN_NOSE:Smiley = new Smiley(FROWN_NOSE, ":-(", SmileyGroup.FROWN);
        public static const GRIN:Smiley = new Smiley(GRIN, ":D", SmileyGroup.GRIN);
        public static const GRIN_NOSE:Smiley = new Smiley(GRIN_NOSE, ":-D", SmileyGroup.GRIN);
        public static const NEUTRAL:Smiley = new Smiley(NEUTRAL, ":|", SmileyGroup.NEUTRAL);
        public static const NEUTRAL_NOSE:Smiley = new Smiley(NEUTRAL_NOSE, ":-|", SmileyGroup.NEUTRAL);
        public static const SAD:Smiley = new Smiley(SAD, ";(", SmileyGroup.SAD);
        public static const SAD_NOSE:Smiley = new Smiley(SAD_NOSE, ";-(", SmileyGroup.SAD);
        public static const SEALED:Smiley = new Smiley(SEALED, ":X", SmileyGroup.SEALED);
        public static const SEALED_NOSE:Smiley = new Smiley(SEALED_NOSE, ":-X", SmileyGroup.SEALED);
        public static const SMILE:Smiley = new Smiley(SMILE, ":)", SmileyGroup.SMILE);
        public static const SMILE_NOSE:Smiley = new Smiley(SMILE_NOSE, ":-)", SmileyGroup.SMILE);
        public static const SURPRISED:Smiley = new Smiley(SURPRISED, ":O", SmileyGroup.SURPRISED);
        public static const SURPRISED_NOSE:Smiley = new Smiley(SURPRISED_NOSE, ":-O", SmileyGroup.SURPRISED);
        public static const SURPRISED_SMALL:Smiley = new Smiley(SURPRISED_SMALL, ":o", SmileyGroup.SURPRISED);
        public static const SURPRISED_NOSE_SMALL:Smiley = new Smiley(SURPRISED_NOSE_SMALL, ":-o", SmileyGroup.SURPRISED);
        public static const TONGUE:Smiley = new Smiley(TONGUE, ":P", SmileyGroup.TONGUE);
        public static const TONGUE_NOSE:Smiley = new Smiley(TONGUE_NOSE, ":-P", SmileyGroup.TONGUE);
        public static const TONGUE_SMALL:Smiley = new Smiley(TONGUE_SMALL, ":p", SmileyGroup.TONGUE);
        public static const TONGUE_NOSE_SMALL:Smiley = new Smiley(TONGUE_NOSE_SMALL, ":-p", SmileyGroup.TONGUE);
        public static const WINK:Smiley = new Smiley(WINK, ";)", SmileyGroup.WINK);
        public static const WINK_NOSE:Smiley = new Smiley(WINK_NOSE, ";-)", SmileyGroup.WINK);
        public static const INVALID:Smiley = new Smiley(INVALID, "", SmileyGroup.NONE);

        public function Smiley(param1:Smiley, param2:String, param3:SmileyGroup = null)
        {
            smileyMap[param2] = this;
            this.string = param2;
            this._group = param3;
            return;
        }// end function

        public function toString() : String
        {
            return this.string;
        }// end function

        public function get group() : SmileyGroup
        {
            return this._group;
        }// end function

        public static function fromString(param1:String) : Smiley
        {
            if (smileyMap[param1])
            {
                return smileyMap[param1];
            }
            return INVALID;
        }// end function

    }
}
