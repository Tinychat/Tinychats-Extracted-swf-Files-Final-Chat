package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.user.*;

    public class PrivateMessageSender extends Object
    {
        private var connection:RoomConnection;
        private var users:RoomUsers;
        private var broadcasts:RoomStreamBroadcasts;

        public function PrivateMessageSender(param1:RoomConnection, param2:RoomUsers, param3:RoomStreamBroadcasts)
        {
            this.connection = param1;
            this.users = param2;
            this.broadcasts = param3;
            return;
        }// end function

        public function send(param1:String, param2:UserIdentity, param3:uint = 0) : void
        {
            if (param2)
            {
            }
            var _loc_4:* = this.broadcasts.has(param2);
            this.connection.call(new RoomCallPrivmsg(param1, param3, param2, _loc_4));
            return;
        }// end function

        public function sendToAll(param1:String, param2:uint = 0) : void
        {
            this.send(param1, null, param2);
            return;
        }// end function

    }
}
