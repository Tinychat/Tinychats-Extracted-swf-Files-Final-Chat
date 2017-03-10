package com.tinychat.model.nick
{

    public class ProNickFormatter extends AbstractNickFormatter
    {
        private static const _allowedCharacters:String = "a-zA-Z0-9_[]";

        public function ProNickFormatter()
        {
            return;
        }// end function

        override public function get allowedCharacters() : String
        {
            return _allowedCharacters;
        }// end function

        override public function get typographicCase() : String
        {
            return "default";
        }// end function

    }
}
