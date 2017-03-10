package com.tinychat.ui.mediators.gift
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;
    import com.tinychat.ui.components.gifts.*;
    import org.robotlegs.mvcs.*;

    public class TinychatGiftScreenMediator extends Mediator
    {
        public var view:TinychatGiftScreen;
        public var user:UserIdentity;
        public var users:RoomUsers;

        public function TinychatGiftScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Virtual Gifts";
            this.view.notFoundMessage = this.users.isCurrentUser(this.user) ? ("Someone just tried to send you a Virtual Gift, but you can\'t receive them since you\'re not registered yet. Don\'t miss out again, sign up to receive Virtual Gifts") : ("User is not signed in to Tinychat.com.");
            return;
        }// end function

    }
}
