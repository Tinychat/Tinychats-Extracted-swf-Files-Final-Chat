package com.tinychat.model.social.chat.encoding
{

    public interface FontSettings
    {

        public function FontSettings();

        function get family() : String;

        function set family(param1:String) : void;

        function get size() : Number;

        function set size(param1:Number) : void;

        function get color() : uint;

        function set color(param1:uint) : void;

        function get weight() : String;

        function set weight(param1:String) : void;

    }
}
