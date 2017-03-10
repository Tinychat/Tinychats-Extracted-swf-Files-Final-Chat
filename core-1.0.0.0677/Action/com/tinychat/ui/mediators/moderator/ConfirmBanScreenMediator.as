package com.tinychat.ui.mediators.moderator
{
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.model.api.*;

    public class ConfirmBanScreenMediator extends ConfirmScreenMediator
    {
        public var user:UserIdentity;
        public var banUser:BanUser;

        public function ConfirmBanScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.title = "Confirm ban";
            view.messageDisplay.text = "Are you sure you want to ban " + this.user.name + "?";
            view.confirmLabel = "Ban";
            view.cancelLabel = "Cancel";
            return;
        }// end function

        override protected function confirmedHandler() : void
        {
            this.banUser.dispatch(this.user);
            super.confirmedHandler();
            return;
        }// end function

    }
}
