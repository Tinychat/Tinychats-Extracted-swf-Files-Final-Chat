package com.tinychat.ui.components.social.chat.list
{
    import com.tinychat.model.social.chat.*;
    import flash.text.engine.*;

    public class StringSmileySet extends Object implements SmileySet
    {

        public function StringSmileySet()
        {
            return;
        }// end function

        public function toElement(param1:Smiley, param2:ElementFormat) : ContentElement
        {
            return new TextElement(param1.toString(), param2);
        }// end function

    }
}
