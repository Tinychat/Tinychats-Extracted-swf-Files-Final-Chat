package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;

    public class RoomCallReport extends Object implements RoomMethod
    {
        private var user:UserIdentity;
        private var roomName:String;

        public function RoomCallReport(param1:UserIdentity, param2:String)
        {
            this.user = param1;
            this.roomName = param2;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            var _loc_2:* = "report " + this.roomName + " " + this.user.id + " " + this.user.name;
            param1.call(RoomCallMethodNames.PRIVMSG, null, _loc_2, "", "tcabuse");
            return;
        }// end function

    }
}
