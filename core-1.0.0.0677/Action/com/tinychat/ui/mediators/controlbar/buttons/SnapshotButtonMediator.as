package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class SnapshotButtonMediator extends Mediator
    {
        public var view:SnapshotButton;
        public var triggerStateAction:TriggerStateAction;
        public var broadcasts:RoomBroadcasts;

        public function SnapshotButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            this.broadcasts.started.add(this.broadcastStartedHandler);
            this.broadcasts.stopped.add(this.broadcastStoppedHandler);
            this.updateButtonState();
            this.view.label = "Snapshot";
            this.view.toolTip = "ToolTipBundle.snapshotButton";
            return;
        }// end function

        override public function onRemove() : void
        {
            this.broadcasts.started.remove(this.broadcastStartedHandler);
            this.broadcasts.stopped.remove(this.broadcastStoppedHandler);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.triggerStateAction.dispatch(StateAction.TAKE_SNAPSHOT);
            return;
        }// end function

        private function broadcastStoppedHandler(param1:Broadcast) : void
        {
            this.updateButtonState();
            return;
        }// end function

        private function broadcastStartedHandler(param1:Broadcast) : void
        {
            this.updateButtonState();
            return;
        }// end function

        private function updateButtonState() : void
        {
            this.view.enabled = this.broadcasts.all.length > 0;
            return;
        }// end function

    }
}
