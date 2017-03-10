package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.sounds.*;
    import flash.media.*;
    import flash.net.*;

    public interface CameraBroadcastFactory
    {

        public function CameraBroadcastFactory();

        function newInstance(param1:User, param2:NetStream, param3:Camera, param4:Microphone, param5:MicrophoneOutbundVolumeControl) : CameraBroadcast;

    }
}
