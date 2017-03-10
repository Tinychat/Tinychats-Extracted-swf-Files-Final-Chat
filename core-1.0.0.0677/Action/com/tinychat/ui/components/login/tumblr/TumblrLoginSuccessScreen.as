package com.tinychat.ui.components.login.tumblr
{
    import com.tinychat.ui.components.login.*;

    public class TumblrLoginSuccessScreen extends LoginSuccessScreenBase
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, userPicture:false, loadingIndicator:false, titleDisplay:false, updateStatusCheckbox:false, statusLabel:false};

        public function TumblrLoginSuccessScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
