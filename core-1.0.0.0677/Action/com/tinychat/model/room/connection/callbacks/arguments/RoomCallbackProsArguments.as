package com.tinychat.model.room.connection.callbacks.arguments
{
    import __AS3__.vec.*;
    import com.tinychat.model.business.*;

    public class RoomCallbackProsArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackProsArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toProUsers() : Vector.<RoomCallbackProArguments>
        {
            var _loc_2:Object = null;
            var _loc_1:* = new Vector.<RoomCallbackProArguments>;
            for each (_loc_2 in args)
            {
                
                if (Roles.inRoleAndMore(_loc_2.stype, Roles.PRO))
                {
                    _loc_1.push(new RoomCallbackProArguments([_loc_2]));
                }
            }
            return _loc_1;
        }// end function

    }
}
