package com.tinychat.ui.mediators.login
{
    import com.tinychat.model.user.*;
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.mediators.screen.*;

    public class NicknameSelectionScreenMediator extends ScreenMediator
    {
        public var view:NicknameSelectionScreen;
        public var usersProxy:RoomUsers;

        public function NicknameSelectionScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Change your nickname";
            this.view.nickname = this.usersProxy.currentUser.name;
            this.view.nicknameSubmitted.add(this.nicknameSubmittedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.nicknameSubmitted.remove(this.nicknameSubmittedHandler);
            return;
        }// end function

        private function nicknameSubmittedHandler(param1:String) : void
        {
            complete();
            return;
        }// end function

    }
}
