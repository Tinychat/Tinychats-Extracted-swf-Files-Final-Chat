package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.cameraquality.*;
    import com.tinychat.model.monitor.*;
    import com.tinychat.model.sounds.*;
    import flash.media.*;
    import flash.net.*;
    import org.osflash.signals.*;

    public class CameraBroadcastBase extends AbstractUserBroadcast implements CameraBroadcast
    {
        private var _camera:Camera;
        private var microphone:Microphone;
        private var _broadcastingVideoChange:Signal;
        private var isPublished:Boolean;
        private var cameraActivityMonitor:CameraActivity;
        private var microphoneActivityMonitor:MicrophoneActivity;
        private var microphoneVolume:MicrophoneOutbundVolumeControl;

        public function CameraBroadcastBase(param1:User, param2:NetStream, param3:Camera, param4:Microphone, param5:CameraQuality, param6:MicrophoneOutbundVolumeControl)
        {
            this._camera = param3;
            this.microphone = param4;
            this.microphoneVolume = param6;
            if (param3)
            {
                param5.setQuality(param3);
            }
            this.cameraActivityMonitor = new CameraActivity(param3);
            this.microphoneActivityMonitor = new MicrophoneActivity(param4);
            this._broadcastingVideoChange = new Signal(Boolean);
            super(param1, param2, this.cameraActivityMonitor, this.microphoneActivityMonitor);
            return;
        }// end function

        public function get camera() : Camera
        {
            return this._camera;
        }// end function

        public function get muted() : Boolean
        {
            return this.microphoneVolume.muted;
        }// end function

        public function mute() : void
        {
            this.microphoneActivityMonitor.microphone = null;
            this.microphoneVolume.mute();
            return;
        }// end function

        public function unmute() : void
        {
            this.microphoneActivityMonitor.microphone = this.microphone;
            this.microphoneVolume.unmute();
            return;
        }// end function

        public function get isBroadcastingVideo() : Boolean
        {
            return this.camera != null;
        }// end function

        public function get broadcastingVideoChange() : ISignal
        {
            return this._broadcastingVideoChange;
        }// end function

        public function switchCamera(param1:Camera) : void
        {
            this._camera = param1;
            stream.attachCamera(param1);
            this.cameraActivityMonitor.camera = param1;
            this._broadcastingVideoChange.dispatch(this.isBroadcastingVideo);
            return;
        }// end function

        public function switchMicrophone(param1:Microphone) : void
        {
            this.microphone = param1;
            stream.attachAudio(param1);
            this.microphoneActivityMonitor.microphone = param1;
            this.microphoneVolume.source = param1;
            return;
        }// end function

        public function attachToVideo(param1:CameraVideoElement) : void
        {
            param1.attachCamera(this.camera);
            return;
        }// end function

        override public function start() : void
        {
            super.start();
            this.switchCamera(this.camera);
            this.switchMicrophone(this.microphone);
            if (!this.isPublished)
            {
                stream.publish(id, "live");
                this.isPublished = true;
            }
            return;
        }// end function

        override public function dispose() : void
        {
            if (stream)
            {
                this.switchCamera(null);
                this.switchMicrophone(null);
            }
            super.dispose();
            return;
        }// end function

    }
}
