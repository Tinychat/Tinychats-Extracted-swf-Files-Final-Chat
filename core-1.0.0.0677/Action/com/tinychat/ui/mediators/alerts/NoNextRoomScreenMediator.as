package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.controller.commands.broadcast.signals.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.mediators.screen.*;

    public class NoNextRoomScreenMediator extends ScreenMediator
    {
        public var view:TitleWindowElementBase;
        public var connectToNextRoom:ConnectToNextRoom;

        public function NoNextRoomScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Next room unavailable";
            this.view.statusLabelText = "There\'s currently no next room to go into. Please try again shortly.";
            this.view.confirmLabel = "Try again";
            this.view.cancelLabel = "Cancel";
            this.view.confirmed.add(this.confirmedHandler);
            this.view.canceled.add(this.canceledHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            this.view.canceled.add(this.canceledHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            complete();
            this.connectToNextRoom.dispatch();
            return;
        }// end function

        private function canceledHandler() : void
        {
            canceled();
            return;
        }// end function

    }
}
