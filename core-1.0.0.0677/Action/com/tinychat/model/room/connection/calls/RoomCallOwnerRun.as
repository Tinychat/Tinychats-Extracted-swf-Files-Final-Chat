package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.room.connection.*;

    public class RoomCallOwnerRun extends Object implements RoomMethod
    {
        private var message:String;

        public function RoomCallOwnerRun(param1:String)
        {
            this.message = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call(RoomCallMethodNames.OWNER_RUN, null, this.message);
            return;
        }// end function

    }
}
