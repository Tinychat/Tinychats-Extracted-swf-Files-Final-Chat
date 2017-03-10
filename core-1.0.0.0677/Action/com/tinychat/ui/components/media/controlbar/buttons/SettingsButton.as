package com.tinychat.ui.components.controlbar.buttons
{
    import com.tinychat.ui.components.spark.*;

    public class SettingsButton extends PopupList
    {
        private static var _skinParts:Object = {dropDown:false, dataGroup:false, dropIndicator:false, headerDisplay:false, scroller:false, openButton:true};

        public function SettingsButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
