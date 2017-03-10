package com.tinychat.ui.components.social.chat
{
    import spark.components.*;

    public class PlaySoundsCheckbox extends CheckBox
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function PlaySoundsCheckbox()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
