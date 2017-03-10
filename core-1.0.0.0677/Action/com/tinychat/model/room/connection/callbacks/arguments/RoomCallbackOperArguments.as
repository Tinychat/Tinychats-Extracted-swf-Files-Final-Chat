package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackOperArguments extends RoomCallbackArgumentsBase implements UserArgument
    {

        public function RoomCallbackOperArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toUser() : UserIdentity
        {
            if (args.length == 1)
            {
                return new UniqueUser(args[0].id, args[0].nick);
            }
            return new UniqueUser(args[0], args[1]);
        }// end function

    }
}
