package com.tinychat.model.room.connection.callbacks.arguments
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackJoinsArguments extends RoomCallbackArgumentsBase implements UsersArgument
    {

        public function RoomCallbackJoinsArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toUsers() : Vector.<UserIdentity>
        {
            var _loc_2:Object = null;
            var _loc_1:* = new Vector.<UserIdentity>;
            for each (_loc_2 in args)
            {
                
                _loc_1.push(new UniqueUser(_loc_2.id, _loc_2.nick, _loc_2.account));
            }
            return _loc_1;
        }// end function

    }
}
