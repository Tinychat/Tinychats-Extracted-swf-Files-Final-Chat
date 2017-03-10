package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.user.*;

    public class PrepareGiftSender extends Object
    {
        private var connection:RoomConnection;
        private var users:RoomUsers;
        private var broadcasts:RoomStreamBroadcasts;

        public function PrepareGiftSender(param1:RoomConnection, param2:RoomUsers, param3:RoomStreamBroadcasts)
        {
            this.connection = param1;
            this.users = param2;
            this.broadcasts = param3;
            return;
        }// end function

        public function send(param1:UserIdentity) : void
        {
            this.connection.call(new RoomCallPrepareGift(param1));
            return;
        }// end function

    }
}
