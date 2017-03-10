package com.tinychat.ui.components.login.tumblr
{
    import spark.components.*;

    public class TumblrButton extends Button
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function TumblrButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
