package com.tinychat.ui.components.broadcast.screens
{
    import com.tinychat.ui.components.spark.*;
    import spark.components.*;

    public class BroadcastAuthorizationWorkaroundScreen extends TitleWindowElementBase
    {
        public var workaroundInfoDisplay:RichEditableText;
        private static var _skinParts:Object = {confirm:false, cancel:false, workaroundInfoDisplay:true, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function BroadcastAuthorizationWorkaroundScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
