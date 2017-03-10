package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.room.connection.*;

    public class RoomCallBroadcastAuthentication extends Object implements RoomMethod
    {
        private var broadcastAuthorization:BroadcastAuthorizationBase;

        public function RoomCallBroadcastAuthentication(param1:BroadcastAuthorizationBase)
        {
            this.broadcastAuthorization = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call(RoomCallMethodNames.BROADCAST_AUTHENTICATION, null, this.broadcastAuthorization.token);
            return;
        }// end function

    }
}
