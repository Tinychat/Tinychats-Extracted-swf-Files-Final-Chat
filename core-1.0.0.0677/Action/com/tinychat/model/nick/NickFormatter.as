package com.tinychat.model.nick
{

    public interface NickFormatter
    {

        public function NickFormatter();

        function get allowedCharacters() : String;

        function get typographicCase() : String;

        function format(param1:String) : String;

    }
}
