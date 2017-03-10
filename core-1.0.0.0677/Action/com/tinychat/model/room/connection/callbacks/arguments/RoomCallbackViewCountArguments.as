package com.tinychat.model.room.connection.callbacks.arguments
{

    public class RoomCallbackViewCountArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackViewCountArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function get count() : uint
        {
            if (args[1] == "off")
            {
                return 0;
            }
            return parseInt(args[1]);
        }// end function

    }
}
