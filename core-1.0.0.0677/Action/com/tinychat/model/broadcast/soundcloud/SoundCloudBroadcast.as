package com.tinychat.model.broadcast.soundcloud
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;
    import com.tinychat.model.soundcloud.*;
    import mx.utils.*;
    import org.osflash.signals.*;

    public class SoundCloudBroadcast extends Object implements MediaBroadcast
    {
        private var _id:String;
        private var _name:String;
        private var _account:String;
        private var player:SoundCloudTrackPlayer;
        private var track:SoundCloudTrack;
        private var startTime:Number;
        private var startPaused:Boolean;
        private var _initiator:UserIdentity;
        private var isTrackLoaded:Boolean;
        private var _isHidden:Boolean;
        private var _renamed:Renamed;
        private var _hidden:Hidden;
        private var _started:Signal;
        private var _stopped:Signal;
        private var _trackLoaded:Signal;
        private static const DEFAULT_NAME:String = "SoundCloud";

        public function SoundCloudBroadcast(param1:SoundCloudTrackPlayer)
        {
            this.player = param1;
            this.player.ended.add(this.endedHandler);
            this._id = UIDUtil.createUID();
            this._name = DEFAULT_NAME;
            this._renamed = new Renamed();
            this._trackLoaded = new Signal();
            this._hidden = new Hidden();
            this._started = new Signal();
            this._stopped = new Signal();
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get mediaId() : String
        {
            return this.track ? (this.track.id) : ("");
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get renamed() : ISignal
        {
            return this._renamed;
        }// end function

        public function get account() : String
        {
            return this._account;
        }// end function

        public function get thumbnailUrl() : String
        {
            return this.track ? (this.track.thumbnailUrl) : ("");
        }// end function

        public function get trackLoaded() : ISignal
        {
            return this._trackLoaded;
        }// end function

        public function get initiator() : UserIdentity
        {
            return this._initiator;
        }// end function

        public function get isPlaying() : Boolean
        {
            return this.player.isPlaying;
        }// end function

        public function get isPaused() : Boolean
        {
            return this.player.isPaused;
        }// end function

        public function get isClosed() : Boolean
        {
            return this.player.isEnded;
        }// end function

        public function get isHidden() : Boolean
        {
            return false;
        }// end function

        public function get hidden() : ISignal
        {
            return this._hidden;
        }// end function

        public function get volume() : Number
        {
            return this.player.volume;
        }// end function

        public function set volume(param1:Number) : void
        {
            this.player.volume = param1;
            return;
        }// end function

        public function get masterVolume() : Number
        {
            return this.player.masterVolume;
        }// end function

        public function set masterVolume(param1:Number) : void
        {
            this.player.masterVolume = param1;
            return;
        }// end function

        public function get muted() : Boolean
        {
            return this.player.muted;
        }// end function

        public function get started() : ISignal
        {
            return this._started;
        }// end function

        public function get stopped() : ISignal
        {
            return this._stopped;
        }// end function

        public function get volumeChanged() : ISignal
        {
            return this.player.volumeChanged;
        }// end function

        public function get currentTime() : Number
        {
            return this.player.currentTime;
        }// end function

        public function get duration() : Number
        {
            return this.player.duration;
        }// end function

        public function seekTo(param1:Number, param2:Boolean) : void
        {
            this.player.seekTo(param1, param2);
            return;
        }// end function

        public function mute() : void
        {
            this.player.mute();
            return;
        }// end function

        public function unmute() : void
        {
            this.player.unmute();
            return;
        }// end function

        public function loadTrack(param1:SoundCloudTrack, param2:Number, param3:UserIdentity, param4:Boolean = false) : void
        {
            if (this.track != param1)
            {
                this.track = param1;
                this.startTime = param2;
                this.startPaused = param4;
                this._initiator = param3;
                if (param1)
                {
                    this.setName(param1.title);
                }
                this.isTrackLoaded = false;
            }
            return;
        }// end function

        public function start() : void
        {
            if (this.track)
            {
                if (!this.isTrackLoaded)
                {
                    this.player.load(this.track.streamUrl);
                    this.isTrackLoaded = true;
                    this._trackLoaded.dispatch();
                }
                if (!this.startPaused)
                {
                    this.player.seekTo(this.startTime, false);
                    this.player.play();
                }
            }
            return;
        }// end function

        public function stop() : void
        {
            this.player.pause();
            return;
        }// end function

        public function play() : void
        {
            this.player.play();
            return;
        }// end function

        public function close() : void
        {
            this.player.stop();
            return;
        }// end function

        public function dispose() : void
        {
            this.player.ended.remove(this.endedHandler);
            return;
        }// end function

        public function hide() : void
        {
            return;
        }// end function

        public function unhide() : void
        {
            return;
        }// end function

        private function setName(param1:String) : void
        {
            if (this._name != param1)
            {
                if (param1 == "")
                {
                    this.setName(DEFAULT_NAME);
                }
                else
                {
                    this._name = param1;
                    this._renamed.dispatch(DEFAULT_NAME, param1);
                }
            }
            return;
        }// end function

        private function endedHandler() : void
        {
            this._stopped.dispatch();
            return;
        }// end function

    }
}
