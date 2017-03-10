package com.tinychat.model.broadcast
{
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.broadcast.room.*;

    public class AllBroadcasts extends BroadcastsAggregator
    {

        public function AllBroadcasts(param1:RoomBroadcasts, param2:GreenRoomBroadcasts)
        {
            super(this.Vector.<Broadcasts>([param1, param2]));
            return;
        }// end function

    }
}
