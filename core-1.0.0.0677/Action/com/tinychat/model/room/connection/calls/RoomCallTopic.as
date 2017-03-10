package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.room.connection.*;

    public class RoomCallTopic extends Object implements RoomMethod
    {
        private var topic:String;

        public function RoomCallTopic(param1:String)
        {
            this.topic = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.call(RoomCallMethodNames.TOPIC, null, this.topic, "");
            return;
        }// end function

    }
}
