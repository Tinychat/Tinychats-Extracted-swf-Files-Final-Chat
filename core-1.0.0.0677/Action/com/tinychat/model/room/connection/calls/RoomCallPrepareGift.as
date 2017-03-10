package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;

    public class RoomCallPrepareGift extends Object implements RoomMethod
    {
        private var userIdentity:UserIdentity;

        public function RoomCallPrepareGift(param1:UserIdentity)
        {
            this.userIdentity = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call(RoomCallMethodNames.PREPARE_GIFT, null, this.userIdentity.id);
            return;
        }// end function

    }
}
