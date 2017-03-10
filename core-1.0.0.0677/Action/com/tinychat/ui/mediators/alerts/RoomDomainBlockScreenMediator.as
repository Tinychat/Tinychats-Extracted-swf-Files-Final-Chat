package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.alerts.*;
    import org.robotlegs.mvcs.*;

    public class RoomDomainBlockScreenMediator extends Mediator
    {
        public var view:RoomDomainBlockScreen;
        public var settings:RoomSettingsProxy;

        public function RoomDomainBlockScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Connection failed";
            this.view.statusLabelText = "To load this room, you must go to " + this.settings.domainBlock + ".";
            return;
        }// end function

    }
}
