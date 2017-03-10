package com.tinychat.ui.components.trial
{
    import com.tinychat.ui.components.alerts.*;

    public class TrialOverlay extends LimitedFeatureScreen
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function TrialOverlay()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
