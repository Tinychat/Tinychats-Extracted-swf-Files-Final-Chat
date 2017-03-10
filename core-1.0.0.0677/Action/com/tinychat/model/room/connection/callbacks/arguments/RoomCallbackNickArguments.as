package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackNickArguments extends RoomCallbackArgumentsBase implements UserArgument
    {

        public function RoomCallbackNickArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toUser() : UserIdentity
        {
            return new UniqueUser(args[2], args[0]);
        }// end function

        public function get newName() : String
        {
            return args[1];
        }// end function

    }
}
