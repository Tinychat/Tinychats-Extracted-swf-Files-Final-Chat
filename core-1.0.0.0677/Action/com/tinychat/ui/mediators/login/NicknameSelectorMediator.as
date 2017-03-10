package com.tinychat.ui.mediators.login
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.nick.*;
    import com.tinychat.model.user.*;
    import com.tinychat.ui.components.login.*;
    import org.robotlegs.mvcs.*;

    public class NicknameSelectorMediator extends Mediator
    {
        public var view:NicknameSelector;
        public var usersProxy:RoomUsers;
        public var formatter:NickFormatter;
        private var occupiedNames:RenameableItemList;

        public function NicknameSelectorMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.occupiedNames = new RenameableItemList(this.usersProxy.allButCurrent);
            this.view.usernameFieldPrompt = "Enter a username and... ";
            this.view.confirmLabel = "Go";
            this.view.occupiedNames = this.occupiedNames;
            this.view.formatter = this.formatter;
            this.usersProxy.added.add(this.userAddedHandler);
            this.usersProxy.removed.add(this.userRemovedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.usersProxy.added.remove(this.userAddedHandler);
            this.usersProxy.removed.remove(this.userRemovedHandler);
            return;
        }// end function

        private function userAddedHandler(param1:User) : void
        {
            this.occupiedNames.addItem(param1);
            return;
        }// end function

        private function userRemovedHandler(param1:User) : void
        {
            if (param1 != this.usersProxy.currentUser)
            {
                this.occupiedNames.removeItem(param1);
            }
            return;
        }// end function

    }
}
