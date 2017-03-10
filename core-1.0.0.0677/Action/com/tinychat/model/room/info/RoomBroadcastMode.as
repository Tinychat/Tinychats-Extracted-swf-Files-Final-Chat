package com.tinychat.model.room.info
{

    public class RoomBroadcastMode extends Object
    {
        private var value:String;
        public static const SINGLE:RoomBroadcastMode = new RoomBroadcastMode(SINGLE, "single");
        public static const MULTI:RoomBroadcastMode = new RoomBroadcastMode(MULTI, "multi");

        public function RoomBroadcastMode(param1:RoomBroadcastMode, param2:String)
        {
            this.value = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

    }
}
