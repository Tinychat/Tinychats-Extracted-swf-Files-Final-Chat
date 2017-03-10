package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class BroadcastAuthorizationScreenMediator extends SequencedScreenMediator
    {
        public var view:BroadcastAuthorizationScreen;
        public var securityPanelProxy:SecurityPanelProxy;

        public function BroadcastAuthorizationScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.securityPanel = this.securityPanelProxy;
            this.view.infoDisplayText = "Click \"Try again\" to allow the use of your camera and microphone in order to broadcast.";
            this.view.helpDisplayText = "<TextFlow xmlns=\'http://ns.adobe.com/textLayout/2008\'><p>" + "Can\'t get past this screen? Either you do not have a webcam or mic installed, or your version of Flash Player is too old. " + "To update Flash Player, <a href=\'http://get.adobe.com/flashplayer\'>click here</a>. " + "Still having trouble? Email us at <a href=\'mailto:support@tinychat.com\'>support@tinychat.com.</a></p></TextFlow>";
            this.view.confirmLabel = "Try again";
            this.view.cancelLabel = "Close";
            this.view.title = "Select \"Allow\", \"Remember\" and \"Close\" to broadcast";
            this.view.canceled.add(this.canceledHandler);
            this.view.receivedAuthorization.add(this.receivedAuthorizationHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.dispose();
            this.view.canceled.remove(this.canceledHandler);
            this.view.receivedAuthorization.remove(this.receivedAuthorizationHandler);
            return;
        }// end function

        private function canceledHandler() : void
        {
            dispatchCanceled();
            return;
        }// end function

        private function receivedAuthorizationHandler() : void
        {
            dispatchGoNext();
            return;
        }// end function

    }
}
