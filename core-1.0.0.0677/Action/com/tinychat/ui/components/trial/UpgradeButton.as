package com.tinychat.ui.components.trial
{
    import spark.components.*;

    public class UpgradeButton extends Button
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function UpgradeButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
