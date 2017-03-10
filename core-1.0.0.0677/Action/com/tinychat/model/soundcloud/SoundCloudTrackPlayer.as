package com.tinychat.model.soundcloud
{
    import com.tinychat.model.sounds.*;
    import flash.events.*;
    import flash.media.*;
    import flash.net.*;
    import org.osflash.signals.*;

    public class SoundCloudTrackPlayer extends Object implements Timed, MasterSoundControllable
    {
        private var sound:Sound;
        private var channel:SoundChannel;
        private var volumeControl:SoundTransformVolumeControl;
        private var _pausedCurrentTime:Number;
        private var _isPlaying:Boolean;
        private var _isEnded:Boolean;
        private var loadCompleted:Boolean;
        private var _playing:Signal;
        private var _ended:Signal;

        public function SoundCloudTrackPlayer()
        {
            this.volumeControl = new SoundTransformVolumeControl();
            this._playing = new Signal(Boolean);
            this._ended = new Signal();
            return;
        }// end function

        public function get isPlaying() : Boolean
        {
            return this._isPlaying;
        }// end function

        public function get isPaused() : Boolean
        {
            return !this.isPlaying;
        }// end function

        public function get isEnded() : Boolean
        {
            return this._isEnded;
        }// end function

        public function get playing() : ISignal
        {
            return this._playing;
        }// end function

        public function get ended() : ISignal
        {
            return this._ended;
        }// end function

        public function get currentTime() : Number
        {
            return this.channel ? (this.isPlaying ? (this.channel.position) : (this._pausedCurrentTime)) : (0);
        }// end function

        public function get duration() : Number
        {
            var _loc_1:Number = 0;
            if (this.sound)
            {
                if (!this.loadCompleted)
                {
                }
                if (this.sound.length > 0)
                {
                    _loc_1 = this.sound.bytesTotal / (this.sound.bytesLoaded / this.sound.length) / 1000;
                }
                else
                {
                    _loc_1 = this.sound.length;
                }
            }
            return _loc_1 > this.currentTime ? (_loc_1) : (this.currentTime);
        }// end function

        public function get volume() : Number
        {
            return this.volumeControl.volume;
        }// end function

        public function set volume(param1:Number) : void
        {
            this.volumeControl.volume = param1;
            return;
        }// end function

        public function get volumeChanged() : ISignal
        {
            return this.volumeControl.volumeChanged;
        }// end function

        public function get masterVolume() : Number
        {
            return this.volumeControl.masterVolume;
        }// end function

        public function set masterVolume(param1:Number) : void
        {
            this.volumeControl.masterVolume = param1;
            return;
        }// end function

        public function get muted() : Boolean
        {
            return this.volumeControl.muted;
        }// end function

        public function mute() : void
        {
            this.volumeControl.mute();
            return;
        }// end function

        public function unmute() : void
        {
            this.volumeControl.unmute();
            return;
        }// end function

        public function load(param1:String) : void
        {
            this.sound = new Sound();
            this.sound.addEventListener(Event.COMPLETE, this.completeHandler);
            this.sound.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.sound.load(new URLRequest(param1));
            this._pausedCurrentTime = 0;
            this.loadCompleted = false;
            this._isEnded = false;
            return;
        }// end function

        public function play() : void
        {
            if (this.sound)
            {
            }
            if (!this._isPlaying)
            {
            }
            if (!this._isEnded)
            {
                this.doPlay(this._pausedCurrentTime);
                this.togglePlaying(true);
            }
            return;
        }// end function

        public function pause() : void
        {
            if (this.isPlaying)
            {
                this._pausedCurrentTime = this.currentTime;
                this.channel.stop();
                this.togglePlaying(false);
            }
            return;
        }// end function

        public function stop() : void
        {
            if (this.sound)
            {
                this.sound.removeEventListener(Event.COMPLETE, this.completeHandler);
                this.sound.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
                try
                {
                    this.sound.close();
                }
                catch (error:Error)
                {
                }
            }
            if (this.channel)
            {
                this.channel.stop();
                this.channel.removeEventListener(Event.SOUND_COMPLETE, this.soundCompleteHandler);
            }
            this._isEnded = true;
            this._isPlaying = false;
            this._ended.dispatch();
            this.sound = null;
            this.channel = null;
            return;
        }// end function

        private function doPlay(param1:Number) : void
        {
            var startTime:* = param1;
            if (this.channel)
            {
                this.channel.removeEventListener(Event.SOUND_COMPLETE, this.soundCompleteHandler);
                this.channel.stop();
            }
            try
            {
                this.channel = this.sound.play(startTime);
                this.channel.addEventListener(Event.SOUND_COMPLETE, this.soundCompleteHandler);
                this.volumeControl.source = this.channel;
            }
            catch (error:Error)
            {
                stop();
            }
            return;
        }// end function

        private function soundCompleteHandler(event:Event) : void
        {
            this.stop();
            return;
        }// end function

        public function seekTo(param1:Number, param2:Boolean) : void
        {
            if (this.currentTime != param1)
            {
                if (this.loadCompleted)
                {
                }
                if (param1 == this.duration)
                {
                    this.stop();
                }
                else if (!this.isPlaying)
                {
                    this._pausedCurrentTime = param1;
                }
                else
                {
                    this.doPlay(param1);
                }
            }
            return;
        }// end function

        private function completeHandler(event:Event) : void
        {
            this.loadCompleted = true;
            return;
        }// end function

        private function ioErrorHandler(event:IOErrorEvent) : void
        {
            this.togglePlaying(false);
            return;
        }// end function

        private function togglePlaying(param1:Boolean) : void
        {
            if (this._isPlaying != param1)
            {
                this._isPlaying = param1;
                this._playing.dispatch(this._isPlaying);
            }
            return;
        }// end function

    }
}
