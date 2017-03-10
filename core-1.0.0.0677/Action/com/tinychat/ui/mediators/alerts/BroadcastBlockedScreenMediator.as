package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.mediators.screen.*;

    public class BroadcastBlockedScreenMediator extends ScreenMediator
    {
        public var view:BroadcastBlockedScreen;

        public function BroadcastBlockedScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Blocked";
            this.view.statusLabelText = "Your broadcast has been banned for 48 hours by a " + "Tinychat administrator for violating our terms of service.";
            this.view.confirmLabel = "Ok";
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            complete();
            return;
        }// end function

    }
}
