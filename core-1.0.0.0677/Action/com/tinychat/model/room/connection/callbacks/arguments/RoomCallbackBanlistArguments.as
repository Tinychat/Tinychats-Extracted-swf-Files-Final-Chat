package com.tinychat.model.room.connection.callbacks.arguments
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackBanlistArguments extends RoomCallbackArgumentsBase implements UsersArgument
    {

        public function RoomCallbackBanlistArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toUsers() : Vector.<UserIdentity>
        {
            var _loc_1:* = new Vector.<UserIdentity>;
            var _loc_2:int = 0;
            while (_loc_2 < args.length)
            {
                
                _loc_1.push(new UniqueUser(args[_loc_2], args[(_loc_2 + 1)]));
                _loc_2 = _loc_2 + 2;
            }
            return _loc_1;
        }// end function

    }
}
