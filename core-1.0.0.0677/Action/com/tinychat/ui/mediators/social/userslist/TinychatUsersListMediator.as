package com.tinychat.ui.mediators.social.userslist
{
    import com.tinychat.controller.commands.gifts.signals.*;
    import com.tinychat.controller.commands.login.signals.*;
    import com.tinychat.controller.commands.utils.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.user.*;
    import com.tinychat.ui.components.social.userlist.*;

    public class TinychatUsersListMediator extends UsersListBaseMediator
    {
        public var users:RoomUsers;
        public var broadcasts:RoomBroadcasts;
        public var loginChangeRequest:LoginChangeRequest;
        public var dispatchSignal:DispatchSignal;
        private var view:TinychatUsersList;
        private var list:IdItemList;

        public function TinychatUsersListMediator(param1:TinychatUsersList)
        {
            this.view = param1;
            super(param1);
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.list = new IdItemList(this.users.all);
            this.view.dataProvider = this.list;
            this.view.currentUser = this.users.currentUser;
            this.broadcasts.all.forEach(function (param1, param2:int, param3:Array) : void
            {
                view.setBroadcaster(param1 as Identity, true);
                return;
            }// end function
            );
            this.users.added.add(this.userAddedHandler);
            this.users.removed.add(this.userRemovedHandler);
            this.users.currentUserChanged.add(this.currentUserChanged);
            this.broadcasts.started.add(this.broadcastStartedHandler);
            this.broadcasts.stopped.add(this.broadcastStoppedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.users.added.remove(this.userAddedHandler);
            this.users.removed.remove(this.userRemovedHandler);
            this.users.currentUserChanged.remove(this.currentUserChanged);
            this.broadcasts.started.remove(this.broadcastStartedHandler);
            this.broadcasts.stopped.remove(this.broadcastStoppedHandler);
            return;
        }// end function

        override protected function buyGiftClickedHandler(param1:RenameableUser) : void
        {
            this.dispatchSignal.dispatch(RequestGift, [param1]);
            return;
        }// end function

        override protected function userSingleClickedHandler(param1:RenameableUser) : void
        {
            if (TinychatUserListItem(param1).isCurrentUser)
            {
                this.loginChangeRequest.dispatch();
            }
            return;
        }// end function

        override protected function userDoubleClickedHandler(param1:RenameableUser) : void
        {
            if (!TinychatUserListItem(param1).isCurrentUser)
            {
                super.userDoubleClickedHandler(param1);
            }
            else
            {
                this.loginChangeRequest.dispatch();
            }
            return;
        }// end function

        private function currentUserChanged(param1:User, param2:User) : void
        {
            this.view.currentUser = param2;
            return;
        }// end function

        private function userAddedHandler(param1:User) : void
        {
            this.list.addItem(param1);
            return;
        }// end function

        private function userRemovedHandler(param1:User) : void
        {
            this.list.removeItemBy(param1);
            return;
        }// end function

        private function broadcastStartedHandler(param1:Broadcast) : void
        {
            this.view.setBroadcaster(param1, true);
            return;
        }// end function

        private function broadcastStoppedHandler(param1:Broadcast) : void
        {
            this.view.setBroadcaster(param1, false);
            return;
        }// end function

    }
}
