package com.tinychat.ui.components.alerts
{

    public class LinkWarningScreen extends LinkAlertBaseScreen
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, urlDisplay:true, loadingIndicator:false, titleDisplay:false, statusLabel:false};

        public function LinkWarningScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
