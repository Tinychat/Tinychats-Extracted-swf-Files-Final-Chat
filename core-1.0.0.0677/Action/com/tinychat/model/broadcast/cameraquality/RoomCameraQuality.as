package com.tinychat.model.broadcast.cameraquality
{
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.user.*;
    import flash.media.*;

    public class RoomCameraQuality extends Object implements CameraQuality
    {
        private var users:RoomUsers;
        private var broadcasts:RoomStreamBroadcasts;
        private var roomInfo:RoomSettingsProxy;

        public function RoomCameraQuality(param1:RoomUsers, param2:RoomStreamBroadcasts, param3:RoomSettingsProxy)
        {
            this.users = param1;
            this.broadcasts = param2;
            this.roomInfo = param3;
            return;
        }// end function

        public function setQuality(param1:Camera) : void
        {
            var _loc_2:uint = 320;
            var _loc_3:uint = 240;
            var _loc_4:uint = 30000;
            var _loc_5:uint = 0;
            var _loc_6:uint = 13;
            var _loc_7:uint = 48;
            var _loc_8:Boolean = true;
            param1.setMode(_loc_2, _loc_3, _loc_6, _loc_8);
            param1.setQuality(_loc_4, _loc_5);
            param1.setKeyFrameInterval(_loc_7);
            return;
        }// end function

    }
}
