package com.tinychat.model.broadcast.room
{
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.youtube.*;

    public class RoomBroadcastCanvasBroadcasts extends BroadcastsAggregator
    {

        public function RoomBroadcastCanvasBroadcasts(param1:RoomBroadcasts, param2:GreenRoomCameraBroadcasts, param3:YouTubeBroadcasts, param4:SoundCloudBroadcasts)
        {
            super(this.Vector.<Broadcasts>([param1, param2, param3, param4]));
            return;
        }// end function

    }
}
