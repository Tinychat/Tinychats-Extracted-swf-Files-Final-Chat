package com.tinychat.model.broadcast.greenroom
{
    import com.tinychat.model.broadcast.base.*;

    public class GreenRoomBroadcasts extends BroadcastsAggregator
    {

        public function GreenRoomBroadcasts(param1:GreenRoomCameraBroadcasts, param2:GreenRoomStreamBroadcasts)
        {
            super(this.Vector.<Broadcasts>([param1, param2]));
            return;
        }// end function

    }
}
