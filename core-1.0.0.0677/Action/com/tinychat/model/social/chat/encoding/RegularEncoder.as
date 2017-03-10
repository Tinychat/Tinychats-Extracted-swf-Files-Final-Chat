package com.tinychat.model.social.chat.encoding
{
    import flash.text.engine.*;

    public class RegularEncoder extends BaseEncoder
    {

        public function RegularEncoder(param1:MouseCursor)
        {
            super(new FontFormatFactory(new ElementFormat()), param1);
            return;
        }// end function

        override public function get splitter()
        {
            return null;
        }// end function

        override public function test(param1:String) : Boolean
        {
            return true;
        }// end function

        override protected function createContentElement(param1:String) : ContentElement
        {
            return new TextElement(param1, format);
        }// end function

    }
}
