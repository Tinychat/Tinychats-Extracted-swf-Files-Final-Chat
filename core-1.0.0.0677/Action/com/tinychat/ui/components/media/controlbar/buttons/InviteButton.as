package com.tinychat.ui.components.controlbar.buttons
{
    import spark.components.*;

    public class InviteButton extends Button
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function InviteButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
