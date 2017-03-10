package com.tinychat.ui.components.sound
{
    import spark.components.*;

    public class VerticalVolumeSlider extends VSlider
    {
        private static var _skinParts:Object = {dataTip:false, track:false, thumb:false};

        public function VerticalVolumeSlider()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
