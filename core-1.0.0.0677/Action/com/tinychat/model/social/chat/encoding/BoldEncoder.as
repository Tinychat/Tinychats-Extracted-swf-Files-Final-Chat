package com.tinychat.model.social.chat.encoding
{
    import flash.text.engine.*;

    public class BoldEncoder extends BaseEncoder
    {

        public function BoldEncoder(param1:MouseCursor)
        {
            super(new FontFormatFactory(new ElementFormat(new FontDescription("_serif", FontWeight.BOLD))), param1);
            return;
        }// end function

        override public function get splitter()
        {
            return EncodingMatchers.EMPHASIZED_MATCHER;
        }// end function

        override public function test(param1:String) : Boolean
        {
            if (param1.charAt(0) == "*")
            {
            }
            return param1.charAt((param1.length - 1)) == "*";
        }// end function

        override protected function createContentElement(param1:String) : ContentElement
        {
            return new TextElement(param1.substring(1, (param1.length - 1)), format);
        }// end function

    }
}
