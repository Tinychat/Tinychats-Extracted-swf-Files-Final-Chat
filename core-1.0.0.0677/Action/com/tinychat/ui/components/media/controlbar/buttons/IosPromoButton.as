package com.tinychat.ui.components.controlbar.buttons
{
    import com.tinychat.ui.components.spark.*;

    public class IosPromoButton extends LinkButton
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, labelDisplay2:false, iconDisplay2:false};

        public function IosPromoButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
