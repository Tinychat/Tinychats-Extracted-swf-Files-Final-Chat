package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;

    public class RoomCallBan extends Object implements RoomMethod
    {
        private var user:UserIdentity;

        public function RoomCallBan(param1:UserIdentity)
        {
            this.user = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call(RoomCallMethodNames.BAN, null, this.user.name, this.user.id);
            return;
        }// end function

    }
}
