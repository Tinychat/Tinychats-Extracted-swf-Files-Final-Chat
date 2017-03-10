package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.ui.components.alerts.*;
    import org.robotlegs.mvcs.*;

    public class BannedScreenMediator extends Mediator
    {
        public var view:BannedScreen;

        public function BannedScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Logged out";
            this.view.statusLabelText = "You have been logged out. You may have been banned from this room, or your account may have logged in from another location.";
            return;
        }// end function

    }
}
