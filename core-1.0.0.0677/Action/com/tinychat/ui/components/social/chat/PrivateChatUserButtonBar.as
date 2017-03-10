package com.tinychat.ui.components.social.chat
{
    import com.tinychat.ui.components.spark.*;

    public class PrivateChatUserButtonBar extends AdvancedButtonBarBase
    {
        private static var _skinParts:Object = {dataGroup:false};

        public function PrivateChatUserButtonBar()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
