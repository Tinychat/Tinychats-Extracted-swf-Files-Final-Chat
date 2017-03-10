package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.ui.components.alerts.*;
    import org.robotlegs.mvcs.*;

    public class RoomClosedScreenMediator extends Mediator
    {
        public var view:RoomClosedScreen;

        public function RoomClosedScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Room closed";
            this.view.statusLabelText = "This room has been closed by a Tinychat moderator.";
            return;
        }// end function

    }
}
