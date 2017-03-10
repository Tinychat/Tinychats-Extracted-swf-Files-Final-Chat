package com.tinychat.ui.mediators.password
{
    import com.tinychat.controller.commands.broadcast.signals.*;
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.password.*;
    import com.tinychat.ui.mediators.screen.*;

    public class BroadcastPasswordPromptMediator extends ScreenMediator
    {
        public var view:BroadcastPasswordPrompt;
        public var settings:RoomSettingsProxy;
        public var broadcastAuthentication:RoomBroadcastAuthorization;
        public var broadcastRequest:StartBroadcastingRequest;
        public var broadcasts:RoomCameraBroadcasts;

        public function BroadcastPasswordPromptMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "A password is required to broadcast.";
            this.view.passwordFieldPrompt = "Enter broadcast password";
            this.view.incorrectPasswordMessage = "Sorry, the password you entered was incorrect.";
            this.view.confirmLabel = "Submit";
            this.view.cancelLabel = "Cancel";
            this.view.submitted.add(this.submittedHandler);
            this.view.canceled.add(this.canceledHandler);
            this.broadcastAuthentication.refreshed.add(this.broadcastAuthenticationRefreshedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.submitted.remove(this.submittedHandler);
            this.view.canceled.remove(this.canceledHandler);
            this.broadcastAuthentication.refreshed.remove(this.broadcastAuthenticationRefreshedHandler);
            return;
        }// end function

        private function submittedHandler(param1:String, param2:String) : void
        {
            this.settings.broadcastPassword = param2;
            this.broadcastAuthentication.refresh();
            return;
        }// end function

        private function canceledHandler() : void
        {
            canceled();
            return;
        }// end function

        private function broadcastAuthenticationRefreshedHandler() : void
        {
            if (this.broadcastAuthentication.status != BroadcastAuthorizationStatus.AUTHORIZED)
            {
                this.view.incorrectPassword();
            }
            else
            {
                complete();
                this.broadcastRequest.dispatch(this.broadcasts);
            }
            return;
        }// end function

    }
}
