package com.tinychat.model.media
{

    public class MediaRestriction extends Object
    {
        private var _name:String;
        public static const ALL:MediaRestriction = new MediaRestriction(ALL, "all");
        public static const NONE:MediaRestriction = new MediaRestriction(NONE, "none");
        public static const OPERATORS:MediaRestriction = new MediaRestriction(OPERATORS, "operators");

        public function MediaRestriction(param1:MediaRestriction, param2:String)
        {
            this._name = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this._name;
        }// end function

    }
}
