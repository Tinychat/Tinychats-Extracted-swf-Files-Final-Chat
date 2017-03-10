package com.tinychat.model.room.connection.callbacks.arguments
{
    import __AS3__.vec.*;

    public class RoomCallbackAvonsArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackAvonsArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toAvonArguments() : Vector.<RoomCallbackAvonArguments>
        {
            var _loc_2:Object = null;
            var _loc_1:* = new Vector.<RoomCallbackAvonArguments>;
            for each (_loc_2 in args)
            {
                
                if (_loc_2.bf != false)
                {
                    _loc_1.push(new RoomCallbackAvonArguments([_loc_2]));
                }
            }
            return _loc_1;
        }// end function

    }
}
