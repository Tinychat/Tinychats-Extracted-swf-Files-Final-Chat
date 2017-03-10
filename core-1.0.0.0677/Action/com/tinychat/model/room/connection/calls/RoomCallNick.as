package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.room.connection.*;

    public class RoomCallNick extends Object implements RoomMethod
    {
        private var newNick:String;

        public function RoomCallNick(param1:String)
        {
            this.newNick = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call(RoomCallMethodNames.NICK, null, this.newNick);
            return;
        }// end function

    }
}
