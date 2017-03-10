package com.tinychat.model.room.connection.callbacks.arguments
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackPointsArguments extends RoomCallbackArgumentsBase implements IdentitiesArgument
    {

        public function RoomCallbackPointsArguments(param1:Array)
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
                
                if (_loc_2.gp > 0)
                {
                    _loc_1.push(new PointsUser(_loc_2.id, _loc_2.gp, _loc_2.alevel));
                }
            }
            return _loc_1;
        }// end function

    }
}
