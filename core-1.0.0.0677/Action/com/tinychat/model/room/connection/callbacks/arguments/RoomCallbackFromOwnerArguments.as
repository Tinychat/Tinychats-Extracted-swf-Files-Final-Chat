package com.tinychat.model.room.connection.callbacks.arguments
{

    public class RoomCallbackFromOwnerArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackFromOwnerArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function get command() : String
        {
            return args[0];
        }// end function

    }
}
