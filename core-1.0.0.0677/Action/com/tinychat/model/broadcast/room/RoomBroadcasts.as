package com.tinychat.model.broadcast.room
{
    import com.tinychat.model.broadcast.base.*;

    public class RoomBroadcasts extends BroadcastsAggregator
    {

        public function RoomBroadcasts(param1:RoomCameraBroadcasts, param2:RoomStreamBroadcasts)
        {
            super(this.Vector.<Broadcasts>([param1, param2]));
            return;
        }// end function

    }
}
