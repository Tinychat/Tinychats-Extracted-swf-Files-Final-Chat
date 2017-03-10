package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackJoinArguments extends RoomCallbackArgumentsBase implements UserArgument
    {

        public function RoomCallbackJoinArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toUser() : UserIdentity
        {
            return new UniqueUser(args[0].id, args[0].nick, args[0].account);
        }// end function

    }
}
