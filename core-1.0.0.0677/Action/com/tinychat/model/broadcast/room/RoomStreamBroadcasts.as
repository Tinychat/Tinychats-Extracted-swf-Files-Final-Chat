package com.tinychat.model.broadcast.room
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.user.*;

    public class RoomStreamBroadcasts extends StreamBroadcasts
    {

        public function RoomStreamBroadcasts(param1:RoomUsers, param2:RoomConnection, param3:RoomStreamBroadcastFactory, param4:MasterSoundControl)
        {
            super(param1, param2, param3, param4);
            return;
        }// end function

    }
}
