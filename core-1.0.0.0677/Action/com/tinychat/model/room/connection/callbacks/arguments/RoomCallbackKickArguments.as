package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackKickArguments extends RoomCallbackArgumentsBase implements UserArgument
    {

        public function RoomCallbackKickArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toUser() : UserIdentity
        {
            return new UniqueUser(args[0], args[1]);
        }// end function

    }
}
