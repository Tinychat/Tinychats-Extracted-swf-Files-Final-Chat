package com.tinychat.model.broadcast.greenroom
{
    import GreenRoomStreamBroadcastFactory.as$887.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.user.*;
    import flash.net.*;

    public class GreenRoomStreamBroadcastFactory extends Object implements StreamBroadcastFactory
    {
        private var roomUsers:RoomUsers;

        public function GreenRoomStreamBroadcastFactory(param1:RoomUsers) : void
        {
            this.roomUsers = param1;
            return;
        }// end function

        public function newInstance(param1:User, param2:NetStream, param3:BroadcastPlatform) : StreamBroadcast
        {
            var _loc_4:* = this.roomUsers.userFromId(new ReverseUserIdentity(param1));
            return new GreenRoomStreamBroadcast(param1, param2, param3, _loc_4);
        }// end function

    }
}
