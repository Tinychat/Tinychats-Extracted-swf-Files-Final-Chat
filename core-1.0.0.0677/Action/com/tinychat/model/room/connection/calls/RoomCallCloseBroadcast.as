package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.api.*;

    public class RoomCallCloseBroadcast extends RoomCallOwnerRun
    {

        public function RoomCallCloseBroadcast(param1:UserIdentity)
        {
            super("_close" + param1.name);
            return;
        }// end function

    }
}
