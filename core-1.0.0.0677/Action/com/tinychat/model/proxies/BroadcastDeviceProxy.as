package com.tinychat.model.proxies
{
    import flash.media.*;
    import org.osflash.signals.*;

    public interface BroadcastDeviceProxy
    {

        public function BroadcastDeviceProxy();

        function get selectedCamera() : Camera;

        function get selectedCameraName() : String;

        function set selectedCameraName(param1:String) : void;

        function get selectedCameraChanged() : ISignal;

        function get selectedMicrophone() : Microphone;

        function get selectedMicrophoneName() : String;

        function set selectedMicrophoneName(param1:String) : void;

        function get selectedMicrophoneChanged() : ISignal;

        function get hasSelectedCamera() : Boolean;

        function get hasSelectedMicrophone() : Boolean;

        function get hasSelectedDevices() : Boolean;

        function set microphoneCodec(param1:String) : void;

        function clearMicrophoneSelection() : void;

    }
}
