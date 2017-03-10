package com.tinychat.model.room.connection.callbacks.arguments
{

    public class RoomCallbackTopicArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackTopicArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function toString() : String
        {
            return args[0];
        }// end function

    }
}
