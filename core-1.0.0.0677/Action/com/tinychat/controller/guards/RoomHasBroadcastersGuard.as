package com.tinychat.controller.guards
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.guards.*;

    public class RoomHasBroadcastersGuard extends AbstractLiveGuard
    {
        private var broadcasts:RoomBroadcasts;

        public function RoomHasBroadcastersGuard(param1:RoomBroadcasts)
        {
            this.broadcasts = param1;
            return;
        }// end function

        override public function approve() : Boolean
        {
            return this.broadcasts.all.length > 0;
        }// end function

        override protected function enableChangeListening() : void
        {
            this.broadcasts.started.add(this.broadcastStartedHandler);
            this.broadcasts.stopped.add(this.broadcastStoppedHandler);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.broadcasts.started.remove(this.broadcastStartedHandler);
            this.broadcasts.stopped.remove(this.broadcastStartedHandler);
            return;
        }// end function

        private function broadcastStartedHandler(param1:Broadcast) : void
        {
            triggerChange();
            return;
        }// end function

        private function broadcastStoppedHandler(param1:Broadcast) : void
        {
            triggerChange();
            return;
        }// end function

    }
}
