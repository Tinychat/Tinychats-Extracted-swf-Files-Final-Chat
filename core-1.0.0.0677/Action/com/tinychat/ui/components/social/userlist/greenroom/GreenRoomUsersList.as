package com.tinychat.ui.components.social.userlist.greenroom
{
    import com.tinychat.ui.components.social.userlist.*;

    public class GreenRoomUsersList extends SortedList
    {
        private static var _skinParts:Object = {dataGroup:false};

        public function GreenRoomUsersList()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
