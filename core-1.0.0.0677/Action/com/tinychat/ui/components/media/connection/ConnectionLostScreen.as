package com.tinychat.ui.components.connection
{

    public class ConnectionLostScreen extends ConnectionRetryScreenBase
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, loadingIndicator:false, titleDisplay:false, statusLabel:false, infoMessage:true};

        public function ConnectionLostScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
