package com.tinychat.model.broadcast.greenroom
{
    import GreenRoomStreamBroadcasts.as$453.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.greenroom.*;
    import com.tinychat.model.user.*;

    public class GreenRoomStreamBroadcasts extends StreamBroadcasts
    {
        private var greenRoomUsers:GreenRoomUsers;
        private var roomUsers:RoomUsers;

        public function GreenRoomStreamBroadcasts(param1:GreenRoomUsers, param2:GreenRoomConnection, param3:GreenRoomStreamBroadcastFactory, param4:MasterSoundControl, param5:RoomUsers)
        {
            this.greenRoomUsers = param1;
            this.roomUsers = param5;
            super(param1, param2, param3, param4);
            return;
        }// end function

        override protected function startStreamBroadcast(param1:Identity, param2:BroadcastPlatform) : void
        {
            var _loc_3:* = this.greenRoomUsers.userFromId(param1);
            if (this.roomUsers.has(new ReverseUserIdentity(_loc_3)))
            {
                super.startStreamBroadcast(param1, param2);
            }
            return;
        }// end function

        override protected function _start(param1:Broadcast) : void
        {
            super._start(param1);
            StreamBroadcast(param1).mute();
            return;
        }// end function

    }
}
