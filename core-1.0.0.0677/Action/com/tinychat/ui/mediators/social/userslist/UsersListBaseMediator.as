package com.tinychat.ui.mediators.social.userslist
{
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.social.userlist.*;
    import org.robotlegs.mvcs.*;

    public class UsersListBaseMediator extends Mediator
    {
        public var privateChatWithUser:PrivateChatWithUser;
        private var view:UsersListBase;

        public function UsersListBaseMediator(param1:UsersListBase)
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.buyGiftClicked.add(this.buyGiftClickedHandler);
            this.view.userSingleClicked.add(this.userSingleClickedHandler);
            this.view.userDoubleClicked.add(this.userDoubleClickedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.buyGiftClicked.remove(this.buyGiftClickedHandler);
            this.view.userSingleClicked.remove(this.userSingleClickedHandler);
            this.view.userDoubleClicked.remove(this.userDoubleClickedHandler);
            return;
        }// end function

        protected function userSingleClickedHandler(param1:RenameableUser) : void
        {
            return;
        }// end function

        protected function userDoubleClickedHandler(param1:RenameableUser) : void
        {
            this.privateChatWithUser.dispatch(param1);
            return;
        }// end function

        protected function buyGiftClickedHandler(param1:RenameableUser) : void
        {
            return;
        }// end function

    }
}
