package com.tinychat.model.broadcast.room
{
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.user.*;

    public class RoomCameraBroadcasts extends CameraBroadcasts
    {

        public function RoomCameraBroadcasts(param1:RoomUsers, param2:RoomConnection, param3:RoomCameraBroadcastFactory)
        {
            super(param1, param2, param3);
            return;
        }// end function

    }
}
