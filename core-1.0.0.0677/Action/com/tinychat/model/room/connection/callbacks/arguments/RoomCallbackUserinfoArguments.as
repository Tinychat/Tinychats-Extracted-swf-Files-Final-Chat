package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackUserinfoArguments extends RoomCallbackArgumentsBase implements IdentityArgument
    {

        public function RoomCallbackUserinfoArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toIdentity() : Identity
        {
            return new UniqueUser(args[0].id, "");
        }// end function

        public function get tinychatUsername() : String
        {
            return args[0].account;
        }// end function

    }
}
