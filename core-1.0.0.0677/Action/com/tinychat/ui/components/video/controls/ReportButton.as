package com.tinychat.ui.components.video.controls
{
    import com.tinychat.ui.components.spark.*;

    public class ReportButton extends IconToggleButton
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function ReportButton()
        {
            return;
        }// end function

        override protected function buttonReleased() : void
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
