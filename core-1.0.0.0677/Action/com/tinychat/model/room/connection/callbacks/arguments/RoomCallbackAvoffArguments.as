package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackAvoffArguments extends RoomCallbackArgumentsBase implements UserArgument
    {

        public function RoomCallbackAvoffArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toUser() : UserIdentity
        {
            return new UniqueUser(args[1], args[2]);
        }// end function

    }
}
