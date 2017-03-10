package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.info.*;

    public class RoomCallConnect extends Object implements RoomMethod
    {
        private var roomInfo:RoomConnectInfo;

        public function RoomCallConnect(param1:RoomConnectInfo)
        {
            this.roomInfo = param1;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            param1.connect(this.roomInfo.rtmp, {room:this.roomInfo.name, type:this.roomInfo.type.toString(), prefix:this.roomInfo.namespace, account:this.roomInfo.account, cookie:this.roomInfo.cookie, version:this.roomInfo.version});
            return;
        }// end function

    }
}
