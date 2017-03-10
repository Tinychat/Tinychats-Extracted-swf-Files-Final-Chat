package com.tinychat.ui.components.alerts
{

    public class LimitedVideoFeatureScreen extends LimitedFeatureScreen
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function LimitedVideoFeatureScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
