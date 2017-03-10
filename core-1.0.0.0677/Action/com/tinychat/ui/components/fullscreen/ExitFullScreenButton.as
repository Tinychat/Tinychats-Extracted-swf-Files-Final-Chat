package com.tinychat.ui.components.fullscreen
{
    import spark.components.*;

    public class ExitFullScreenButton extends Button
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function ExitFullScreenButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
