package com.tinychat.ui.mediators.social.userslist
{
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.ui.components.social.userlist.*;

    public class FacebookUsersListMediator extends UsersListBaseMediator
    {
        public var friends:FacebookFriendsProxy;
        private var view:FacebookUsersList;

        public function FacebookUsersListMediator(param1:FacebookUsersList)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.dataProvider = this.friends.list;
            return;
        }// end function

        private function loggedInHandler() : void
        {
            this.visible = true;
            return;
        }// end function

        private function loggedOutHandler() : void
        {
            this.visible = false;
            return;
        }// end function

        private function set visible(param1:Boolean) : void
        {
            this.view.includeInLayout = param1;
            this.view.visible = param1;
            return;
        }// end function

    }
}
