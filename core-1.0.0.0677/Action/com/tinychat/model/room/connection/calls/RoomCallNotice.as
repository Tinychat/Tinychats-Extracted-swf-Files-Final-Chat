package com.tinychat.model.room.connection.calls
{

    public class RoomCallNotice extends RoomCallOwnerRun
    {

        public function RoomCallNotice(param1:String)
        {
            super("notice" + encodeURI(param1));
            return;
        }// end function

    }
}
