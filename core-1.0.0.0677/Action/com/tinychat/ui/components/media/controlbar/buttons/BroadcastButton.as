package com.tinychat.ui.components.controlbar.buttons
{
    import com.tinychat.ui.components.spark.*;

    public class BroadcastButton extends IconToggleButton
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function BroadcastButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
