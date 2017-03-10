package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.mediators.screen.*;

    public class NoAvailableBroadcastSlotScreenMediator extends ScreenMediator
    {
        public var view:NoAvailableBroadcastSlotScreen;

        public function NoAvailableBroadcastSlotScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "No broadcast slot available";
            this.view.statusLabelText = "Oh no! The room has reached the maximum number of broadcasts. " + "Please try again once a slot becomes available.";
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
