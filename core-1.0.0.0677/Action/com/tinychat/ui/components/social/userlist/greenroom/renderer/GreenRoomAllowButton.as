package com.tinychat.ui.components.social.userlist.greenroom.renderer
{
    import com.tinychat.ui.components.spark.*;

    public class GreenRoomAllowButton extends IconButton
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, labelDisplay2:false, iconDisplay2:false};

        public function GreenRoomAllowButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
