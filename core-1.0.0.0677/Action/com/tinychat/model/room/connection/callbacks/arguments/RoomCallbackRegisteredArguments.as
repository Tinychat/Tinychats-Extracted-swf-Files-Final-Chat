package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackRegisteredArguments extends RoomCallbackArgumentsBase implements UserArgument
    {

        public function RoomCallbackRegisteredArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toUser() : UserIdentity
        {
            return new UniqueUser(args[0].id, args[0].nick, args[0].account);
        }// end function

        public function toRole() : uint
        {
            return new uint(args[0].stype);
        }// end function

    }
}
