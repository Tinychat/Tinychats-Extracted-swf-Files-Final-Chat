package com.tinychat.model.room.connection.callbacks.arguments
{

    public class RoomCallbackPrivmsgArguments extends RoomCallbackArgumentsBase
    {
        private var _message:String;
        private var _color:uint;
        private var _locale:String;

        public function RoomCallbackPrivmsgArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function get roomName() : String
        {
            return args[0];
        }// end function

        public function get message() : String
        {
            var _loc_1:* = args[1].toString().split(",");
            return String.fromCharCode.apply(null, _loc_1);
        }// end function

        public function get color() : uint
        {
            return args[2].toString().split(",")[0].toString().replace("#", "0x");
        }// end function

        public function get locale() : String
        {
            return args[2].toString().split(",")[1];
        }// end function

        public function get username() : String
        {
            return args[3];
        }// end function

    }
}
