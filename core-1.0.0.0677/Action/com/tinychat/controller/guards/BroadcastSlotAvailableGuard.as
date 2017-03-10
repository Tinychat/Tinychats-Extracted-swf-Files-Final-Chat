package com.tinychat.controller.guards
{
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.constants.*;

    public class BroadcastSlotAvailableGuard extends Object implements IGuard
    {
        private var broadcasts:RoomBroadcasts;

        public function BroadcastSlotAvailableGuard(param1:RoomBroadcasts)
        {
            this.broadcasts = param1;
            return;
        }// end function

        public function approve() : Boolean
        {
            return this.broadcasts.all.length < ApplicationConstants.MAX_BROADCASTERS;
        }// end function

    }
}
