package com.tinychat.ui.mediators.userinfo
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.mediators.moderator.*;

    public class ConfirmFollowScreenMediator extends ConfirmScreenMediator
    {
        public var user:UserIdentity;
        public var openLink:OpenLink;

        public function ConfirmFollowScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.title = "Confirm Follow";
            view.messageDisplay.setStyle("textAlign", "center");
            view.messageDisplay.text = "You must be logged into a Tinychat account to initiate follow." + "\nPlease sign in (sign up) and try again.";
            view.confirmLabel = "Continue";
            view.cancelLabel = "Cancel";
            return;
        }// end function

        override protected function confirmedHandler() : void
        {
            this.openLink.dispatch("http://tinychat.com/start/");
            super.confirmedHandler();
            return;
        }// end function

    }
}
