package com.tinychat.ui.components.userinfo
{
    import com.tinychat.ui.components.moderator.*;

    public class ConfirmFollowScreen extends ConfirmScreen
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, messageDisplay:true, loadingIndicator:false, titleDisplay:false, statusLabel:false};

        public function ConfirmFollowScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
