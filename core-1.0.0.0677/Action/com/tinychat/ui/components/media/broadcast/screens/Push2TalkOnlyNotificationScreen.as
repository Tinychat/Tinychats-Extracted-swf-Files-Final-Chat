package com.tinychat.ui.components.broadcast.screens
{
    import com.tinychat.ui.components.spark.*;

    public class Push2TalkOnlyNotificationScreen extends TitleWindowElementBase
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function Push2TalkOnlyNotificationScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
