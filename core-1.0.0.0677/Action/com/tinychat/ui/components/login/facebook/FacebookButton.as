package com.tinychat.ui.components.login.facebook
{
    import spark.components.*;

    public class FacebookButton extends Button
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function FacebookButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
