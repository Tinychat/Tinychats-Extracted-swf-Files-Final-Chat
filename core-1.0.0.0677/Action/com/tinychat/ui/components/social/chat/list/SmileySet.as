package com.tinychat.ui.components.social.chat.list
{
    import com.tinychat.model.social.chat.*;
    import flash.text.engine.*;

    public interface SmileySet
    {

        public function SmileySet();

        function toElement(param1:Smiley, param2:ElementFormat) : ContentElement;

    }
}
