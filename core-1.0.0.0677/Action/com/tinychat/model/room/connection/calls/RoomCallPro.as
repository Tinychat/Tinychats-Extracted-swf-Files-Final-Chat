package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.room.connection.*;

    public class RoomCallPro extends Object implements RoomMethod
    {
        private var flashvars:FlashvarsProxy;

        public function RoomCallPro(param1:FlashvarsProxy)
        {
            this.flashvars = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            if (this.flashvars.prohash != "")
            {
                param1.call(RoomCallMethodNames.PRO, null, this.flashvars.prohash);
            }
            return;
        }// end function

    }
}
