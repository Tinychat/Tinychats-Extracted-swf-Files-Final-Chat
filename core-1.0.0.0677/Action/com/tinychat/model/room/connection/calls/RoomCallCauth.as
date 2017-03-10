package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.room.connection.*;

    public class RoomCallCauth extends Object implements RoomMethod
    {
        private var key:String;

        public function RoomCallCauth(param1:String)
        {
            this.key = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call("cauth", null, this.key);
            return;
        }// end function

    }
}
