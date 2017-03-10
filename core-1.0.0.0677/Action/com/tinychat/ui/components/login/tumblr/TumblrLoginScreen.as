package com.tinychat.ui.components.login.tumblr
{
    import com.tinychat.ui.components.login.*;

    public class TumblrLoginScreen extends LoadingScreenBase
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function TumblrLoginScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
