package com.tinychat.model.room.connection.callbacks.arguments
{

    public class RoomCallbackQuitArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackQuitArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function get name() : String
        {
            return args[0];
        }// end function

    }
}
