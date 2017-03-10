package com.tinychat.controller.guards
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.guards.*;

    public class AbstractBroadcastingGuard extends AbstractLiveGuard
    {
        protected var broadcasts:RoomCameraBroadcasts;

        public function AbstractBroadcastingGuard(param1:RoomCameraBroadcasts)
        {
            this.broadcasts = param1;
            return;
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
            this.broadcasts.stopped.remove(this.broadcastStoppedHandler);
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
