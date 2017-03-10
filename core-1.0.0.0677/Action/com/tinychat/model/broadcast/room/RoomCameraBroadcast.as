package com.tinychat.model.broadcast.room
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.cameraquality.*;
    import com.tinychat.model.sounds.*;
    import flash.media.*;
    import flash.net.*;

    public class RoomCameraBroadcast extends CameraBroadcastBase
    {

        public function RoomCameraBroadcast(param1:User, param2:NetStream, param3:Camera, param4:Microphone, param5:RoomCameraQuality, param6:MicrophoneOutbundVolumeControl)
        {
            super(param1, param2, param3, param4, param5, param6);
            return;
        }// end function

    }
}
