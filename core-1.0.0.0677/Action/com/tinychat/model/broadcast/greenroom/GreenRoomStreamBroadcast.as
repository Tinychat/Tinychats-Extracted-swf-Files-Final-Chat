package com.tinychat.model.broadcast.greenroom
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import flash.net.*;
    import org.osflash.signals.*;

    public class GreenRoomStreamBroadcast extends StreamBroadcastBase
    {
        private var greenRoomUser:User;
        private var correspondingRoomUser:RenameableUser;

        public function GreenRoomStreamBroadcast(param1:User, param2:NetStream, param3:BroadcastPlatform, param4:RenameableUser)
        {
            this.greenRoomUser = param1;
            this.correspondingRoomUser = param4;
            super(param1, param2, param3);
            return;
        }// end function

        override public function get id() : String
        {
            return this.correspondingRoomUser.id;
        }// end function

        override public function get name() : String
        {
            return this.correspondingRoomUser.name;
        }// end function

        override public function get renamed() : ISignal
        {
            return this.correspondingRoomUser.renamed;
        }// end function

        override protected function get streamId() : String
        {
            return this.greenRoomUser.id;
        }// end function

    }
}
