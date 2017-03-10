package com.tinychat.model.room.connection.callbacks.arguments
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackOpersArguments extends RoomCallbackArgumentsBase implements IdentitiesArgument
    {

        public function RoomCallbackOpersArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toIdentities() : Vector.<Identity>
        {
            var _loc_2:Object = null;
            var _loc_1:* = new Vector.<Identity>;
            for each (_loc_2 in args)
            {
                
                if (_loc_2.mod != false)
                {
                    _loc_1.push(new UniqueUser(_loc_2.id, ""));
                }
            }
            return _loc_1;
        }// end function

    }
}
