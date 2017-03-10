package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackProArguments extends RoomCallbackArgumentsBase implements IdentityArgument
    {

        public function RoomCallbackProArguments(param1:Array)
        {
            if (param1)
            {
            }
            if (param1[0] is String)
            {
                param1 = [{id:param1[0]}];
            }
            super(param1);
            return;
        }// end function

        public function toIdentity() : Identity
        {
            return new UniqueUser(args[0].id, "");
        }// end function

        public function toRole() : uint
        {
            return new uint(args[0].stype);
        }// end function

    }
}
