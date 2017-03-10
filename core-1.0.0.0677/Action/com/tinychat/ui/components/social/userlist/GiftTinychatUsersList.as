package com.tinychat.ui.components.social.userlist
{
    import com.tinychat.model.lists.*;

    public class GiftTinychatUsersList extends TinychatUsersList
    {
        private static var _skinParts:Object = {dataGroup:false, userPopupMenu:false};

        public function GiftTinychatUsersList()
        {
            return;
        }// end function

        override protected function get filterFunction() : Function
        {
            return function (param1:Object) : Boolean
            {
                return TinychatUserListItem(param1).account.length > 0;
            }// end function
            ;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
