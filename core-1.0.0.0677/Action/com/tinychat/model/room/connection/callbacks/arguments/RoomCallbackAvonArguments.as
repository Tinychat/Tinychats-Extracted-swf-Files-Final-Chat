package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.room.connection.callbacks.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackAvonArguments extends RoomCallbackArgumentsBase implements UserArgument
    {
        private var id:String;
        private var userName:String;
        private var platform:BroadcastPlatform;

        public function RoomCallbackAvonArguments(param1:Array, param2:String = "")
        {
            var _loc_3:Array = null;
            super(param1);
            if (RoomCallbackMethodNames.AVON == param2)
            {
                _loc_3 = args[0].toString().split(":", 2);
                this.userName = args[1];
            }
            else
            {
                _loc_3 = new Array(args[0].id, args[0].btype);
                this.userName = args[0].nick;
            }
            this.id = _loc_3[0];
            this.platform = BroadcastPlatform.fromString(_loc_3[1]);
            this.platform = this.platform ? (this.platform) : (BroadcastPlatform.DESKTOP);
            return;
        }// end function

        public function toUser() : UserIdentity
        {
            return new UniqueUser(this.id, this.userName);
        }// end function

        public function toPlatform() : BroadcastPlatform
        {
            return this.platform;
        }// end function

    }
}
