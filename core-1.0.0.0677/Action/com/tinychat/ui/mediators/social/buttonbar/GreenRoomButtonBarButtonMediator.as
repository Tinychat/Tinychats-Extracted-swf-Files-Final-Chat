package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.guards.composite.*;
    import com.tinychat.controller.guards.greenroom.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import org.robotlegs.mvcs.*;

    public class GreenRoomButtonBarButtonMediator extends Mediator
    {
        public var view:GreenRoomButtonBarButton;
        public var settings:RoomSettingsProxy;
        public var broadcasts:GreenRoomStreamBroadcasts;
        private var visibleGuard:AllOfGuards;

        public function GreenRoomButtonBarButtonMediator(param1:IsOperatorGuard, param2:ConnectedToGreenRoomGuard)
        {
            this.visibleGuard = new AllOfGuards(param1, param2);
            return;
        }// end function

        override public function onRegister() : void
        {
            this.updateVisibility(this.visibleGuard.approve());
            this.visibleGuard.addChangeListener(this.updateVisibility);
            this.updateBroadcastCount();
            this.broadcasts.started.add(this.broadcastStartedHandler);
            this.broadcasts.stopped.add(this.broadcastStoppedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.visibleGuard.removeChangeListener(this.updateVisibility);
            this.broadcasts.started.remove(this.broadcastStartedHandler);
            this.broadcasts.stopped.remove(this.broadcastStoppedHandler);
            return;
        }// end function

        private function broadcastStartedHandler(param1:Broadcast) : void
        {
            this.updateBroadcastCount();
            return;
        }// end function

        private function broadcastStoppedHandler(param1:Broadcast) : void
        {
            this.updateBroadcastCount();
            return;
        }// end function

        private function updateBroadcastCount() : void
        {
            this.view.count = this.broadcasts.all.length;
            return;
        }// end function

        private function updateVisibility(param1:Boolean) : void
        {
            this.view.visible = param1;
            this.view.includeInLayout = param1;
            return;
        }// end function

    }
}
