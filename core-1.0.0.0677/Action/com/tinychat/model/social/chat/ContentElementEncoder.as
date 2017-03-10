package com.tinychat.model.social.chat
{
    import __AS3__.vec.*;

    public interface ContentElementEncoder
    {

        public function ContentElementEncoder();

        function get fontFamily() : String;

        function set fontFamily(param1:String) : void;

        function get fontSize() : Number;

        function set fontSize(param1:Number) : void;

        function get fontColor() : uint;

        function set fontColor(param1:uint) : void;

        function encode(param1:String) : Vector.<ContentElement>;

    }
}
