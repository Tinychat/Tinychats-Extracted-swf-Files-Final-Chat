package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.room.connection.*;

    public class RoomCallPrivateRoom extends Object implements RoomMethod
    {
        private var value:Boolean;

        public function RoomCallPrivateRoom(param1:Boolean)
        {
            this.value = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call(RoomCallMethodNames.PRIVATE_ROOM, null, this.value ? ("yes") : ("no"));
            return;
        }// end function

    }
}
