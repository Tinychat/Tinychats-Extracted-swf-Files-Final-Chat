package com.tinychat.model.room.connection.callbacks.arguments
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.callbacks.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackPointArguments extends RoomCallbackArgumentsBase implements IdentitiesArgument
    {
        private var upoint:PointsUser;

        public function RoomCallbackPointArguments(param1:Array, param2:String)
        {
            super(param1);
            switch(param2)
            {
                case RoomCallbackMethodNames.JOIN:
                case RoomCallbackMethodNames.REGISTERED:
                {
                    this.upoint = new PointsUser(args[0].id, args[0].gp, args[0].alevel);
                    break;
                }
                case RoomCallbackMethodNames.GIFT:
                {
                    this.upoint = new PointsUser(args[1].id, args[1].points, args[1].achievement);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function toIdentities() : Vector.<Identity>
        {
            var _loc_1:* = new Vector.<Identity>;
            _loc_1.push(this.upoint);
            return _loc_1;
        }// end function

    }
}
