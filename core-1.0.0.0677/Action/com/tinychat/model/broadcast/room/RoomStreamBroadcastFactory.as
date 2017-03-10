package com.tinychat.model.broadcast.room
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import flash.net.*;

    public class RoomStreamBroadcastFactory extends Object implements StreamBroadcastFactory
    {

        public function RoomStreamBroadcastFactory()
        {
            return;
        }// end function

        public function newInstance(param1:User, param2:NetStream, param3:BroadcastPlatform) : StreamBroadcast
        {
            return new RoomStreamBroadcast(param1, param2, param3);
        }// end function

    }
}
