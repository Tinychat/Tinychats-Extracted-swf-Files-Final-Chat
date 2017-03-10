package com.tinychat.model.room.connection.callbacks.arguments
{

    public class RoomCallbackNoticeArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackNoticeArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function get messages() : Array
        {
            return args;
        }// end function

    }
}
