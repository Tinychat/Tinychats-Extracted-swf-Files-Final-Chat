package com.tinychat.model.broadcast.room
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.cameraquality.*;
    import com.tinychat.model.sounds.*;
    import flash.media.*;
    import flash.net.*;

    public class RoomCameraBroadcastFactory extends Object implements CameraBroadcastFactory
    {
        private var cameraQuality:RoomCameraQuality;

        public function RoomCameraBroadcastFactory(param1:RoomCameraQuality)
        {
            this.cameraQuality = param1;
            return;
        }// end function

        public function newInstance(param1:User, param2:NetStream, param3:Camera, param4:Microphone, param5:MicrophoneOutbundVolumeControl) : CameraBroadcast
        {
            return new RoomCameraBroadcast(param1, param2, param3, param4, this.cameraQuality, param5);
        }// end function

    }
}
