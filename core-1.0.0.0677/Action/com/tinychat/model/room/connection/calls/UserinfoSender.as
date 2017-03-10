package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.user.*;

    public class UserinfoSender extends Object
    {
        private var connection:RoomConnection;
        private var users:RoomUsers;
        private var broadcasts:RoomStreamBroadcasts;

        public function UserinfoSender(param1:RoomConnection)
        {
            this.connection = param1;
            return;
        }// end function

        public function send(param1:UserIdentity) : void
        {
            this.connection.call(new RoomCallUserinfo(param1));
            return;
        }// end function

    }
}
