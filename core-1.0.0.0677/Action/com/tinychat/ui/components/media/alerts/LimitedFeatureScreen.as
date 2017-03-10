package com.tinychat.ui.components.alerts
{
    import com.tinychat.ui.components.spark.*;
    import mx.utils.*;

    public class LimitedFeatureScreen extends TitleWindowElementBase
    {
        private var _featureName:String;
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function LimitedFeatureScreen()
        {
            return;
        }// end function

        public function set featureName(param1:String) : void
        {
            if (this._featureName != param1)
            {
                this._featureName = param1;
                super.statusLabelText = this.substituteInFeatureName(statusLabelText);
            }
            return;
        }// end function

        override public function set statusLabelText(param1:String) : void
        {
            if (statusLabelText != param1)
            {
                super.statusLabelText = this.substituteInFeatureName(param1);
            }
            return;
        }// end function

        private function substituteInFeatureName(param1:String) : String
        {
            return StringUtil.substitute(param1, this._featureName);
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
