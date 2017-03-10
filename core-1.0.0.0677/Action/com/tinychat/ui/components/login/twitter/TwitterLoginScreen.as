package com.tinychat.ui.components.login.twitter
{
    import com.tinychat.ui.components.login.*;

    public class TwitterLoginScreen extends LoadingScreenBase
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function TwitterLoginScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
