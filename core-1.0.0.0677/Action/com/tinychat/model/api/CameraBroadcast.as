package com.tinychat.model.api
{
    import flash.media.*;
    import org.osflash.signals.*;

    public interface CameraBroadcast extends UserBroadcast, AllVideoAttachable, Muteable
    {

        public function CameraBroadcast();

        function get isBroadcastingVideo() : Boolean;

        function get broadcastingVideoChange() : ISignal;

        function switchCamera(param1:Camera) : void;

        function switchMicrophone(param1:Microphone) : void;

    }
}
