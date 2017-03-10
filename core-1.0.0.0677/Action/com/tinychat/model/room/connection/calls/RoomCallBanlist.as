package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.room.connection.*;

    public class RoomCallBanlist extends Object implements RoomMethod
    {

        public function RoomCallBanlist()
        {
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call(RoomCallMethodNames.BANLIST, null);
            return;
        }// end function

    }
}
