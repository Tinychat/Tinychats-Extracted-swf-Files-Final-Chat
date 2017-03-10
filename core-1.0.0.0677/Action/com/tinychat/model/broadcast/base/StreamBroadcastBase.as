package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.monitor.*;
    import com.tinychat.model.signals.*;
    import com.tinychat.model.sounds.*;
    import flash.net.*;
    import org.osflash.signals.*;

    public class StreamBroadcastBase extends AbstractUserBroadcast implements StreamBroadcast
    {
        private var volumeController:MasterSoundControllable;
        private var _isHidden:Boolean;
        private var _hidden:Hidden;
        private var _platform:BroadcastPlatform;

        public function StreamBroadcastBase(param1:User, param2:NetStream, param3:BroadcastPlatform)
        {
            super(param1, param2, new StreamVideoActivity(param2), new StreamAudioActivity(param2));
            this.volumeController = new SoundTransformVolumeControl(param2);
            this._hidden = new Hidden();
            this._platform = param3;
            return;
        }// end function

        public function get volume() : Number
        {
            return this.volumeController.volume;
        }// end function

        public function set volume(param1:Number) : void
        {
            this.volumeController.volume = param1;
            return;
        }// end function

        public function get masterVolume() : Number
        {
            return this.volumeController.masterVolume;
        }// end function

        public function set masterVolume(param1:Number) : void
        {
            this.volumeController.masterVolume = param1;
            return;
        }// end function

        public function get volumeChanged() : ISignal
        {
            return this.volumeController.volumeChanged;
        }// end function

        public function get muted() : Boolean
        {
            return this.volumeController.muted;
        }// end function

        public function get hidden() : ISignal
        {
            return this._hidden;
        }// end function

        public function get isHidden() : Boolean
        {
            return this._isHidden;
        }// end function

        public function get platform() : BroadcastPlatform
        {
            return this._platform;
        }// end function

        public function mute() : void
        {
            this.volumeController.mute();
            return;
        }// end function

        public function unmute() : void
        {
            this.volumeController.unmute();
            return;
        }// end function

        public function hide() : void
        {
            if (!this._isHidden)
            {
                this.stop();
                this._isHidden = true;
                this._hidden.dispatch(this._isHidden);
            }
            return;
        }// end function

        public function unhide() : void
        {
            if (this._isHidden)
            {
                this.start();
                this._isHidden = false;
                this._hidden.dispatch(this._isHidden);
            }
            return;
        }// end function

        public function attachToVideo(param1:StreamingVideoElement) : void
        {
            param1.rotate90CW = this.isAndroidBroadcast;
            param1.rotate270CW = this.isiOSBroadcast;
            param1.attachNetStream(stream);
            return;
        }// end function

        override public function start() : void
        {
            if (!isClosed)
            {
            }
            if (!isPlaying)
            {
                stream.play(this.streamId);
                super.start();
            }
            return;
        }// end function

        override public function stop() : void
        {
            if (!isClosed)
            {
            }
            if (isPlaying)
            {
                stream.close();
                super.stop();
            }
            return;
        }// end function

        protected function get streamId() : String
        {
            return id;
        }// end function

        protected function get isAndroidBroadcast() : Boolean
        {
            return this.platform == BroadcastPlatform.ANDROID;
        }// end function

        protected function get isiOSBroadcast() : Boolean
        {
            return this.platform == BroadcastPlatform.IOS;
        }// end function

    }
}
