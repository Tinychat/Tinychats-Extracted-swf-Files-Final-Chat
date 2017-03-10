package com.tinychat.ui.components.sound
{
    import spark.components.*;

    public class HorizontalVolumeSlider extends HSlider
    {
        private static var _skinParts:Object = {dataTip:false, track:false, thumb:false};

        public function HorizontalVolumeSlider()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
