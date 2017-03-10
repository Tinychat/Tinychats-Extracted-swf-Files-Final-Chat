package com.tinychat.model.social.chat.encoding
{
    import com.tinychat.model.social.chat.*;
    import com.tinychat.ui.components.social.chat.list.*;
    import flash.text.engine.*;

    public class SmileyEncoder extends BaseEncoder
    {
        private var set:SmileySet;

        public function SmileyEncoder(param1:SmileySet, param2:MouseCursor)
        {
            super(new FontFormatFactory(new ElementFormat()), param2);
            this.set = param1;
            return;
        }// end function

        override public function get splitter()
        {
            return EncodingMatchers.SMILEY_MATCHER;
        }// end function

        override public function test(param1:String) : Boolean
        {
            return Smiley.fromString(param1) != Smiley.INVALID;
        }// end function

        override protected function createContentElement(param1:String) : ContentElement
        {
            return this.set.toElement(Smiley.fromString(param1), format);
        }// end function

    }
}
