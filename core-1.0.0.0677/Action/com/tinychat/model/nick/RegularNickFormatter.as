package com.tinychat.model.nick
{

    public class RegularNickFormatter extends AbstractNickFormatter
    {
        private static const _allowedCharacters:String = "a-zA-Z0-9_";

        public function RegularNickFormatter()
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

        override public function format(param1:String) : String
        {
            return super.format(param1);
        }// end function

    }
}
