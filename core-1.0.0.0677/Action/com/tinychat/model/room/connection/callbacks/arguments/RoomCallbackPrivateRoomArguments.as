package com.tinychat.model.room.connection.callbacks.arguments
{

    public class RoomCallbackPrivateRoomArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackPrivateRoomArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function get isPrivate() : Boolean
        {
            return args[0] == "yes";
        }// end function

    }
}
