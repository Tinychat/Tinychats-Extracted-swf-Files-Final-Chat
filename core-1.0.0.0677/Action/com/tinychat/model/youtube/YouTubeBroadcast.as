package com.tinychat.model.youtube
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;
    import com.tinychat.ui.components.youtube.*;
    import com.tinychat.vendors.youtube.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.utils.*;
    import org.osflash.signals.*;

    public class YouTubeBroadcast extends Object implements MediaBroadcast
    {
        private var _id:String;
        private var _name:String;
        private var _isHidden:Boolean;
        private var player:YouTubePlayer;
        private var _clip:YouTubeClip;
        private var volumeController:YouTubePlayerVolumeControl;
        private var newClip:Boolean;
        private var _initiator:UserIdentity;
        private var startTime:Number;
        private var clipLoaded:Boolean;
        private var _isClosed:Boolean;
        private var isStarted:Boolean;
        private var startPaused:Boolean;
        private var lastPlayerState:YouTubePlayerState;
        private var lastPlayTime:Number;
        private var _timeWatched:Number;
        private var _renamed:Renamed;
        private var _started:Signal;
        private var _stopped:Signal;
        private var _hidden:Hidden;
        private var _stateChanged:Signal;

        public function YouTubeBroadcast(param1:YouTubePlayer, param2:YouTubePlayerVolumeControl)
        {
            this.player = param1;
            this.volumeController = param2;
            this._id = UIDUtil.createUID();
            this._name = "YouTube";
            this._timeWatched = 0;
            this._renamed = new Renamed();
            this._started = new Signal();
            this._stopped = new Signal();
            this._hidden = new Hidden();
            this._stateChanged = new Signal();
            this.addPlayerListeners();
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get mediaId() : String
        {
            return this._clip ? (this._clip.id) : ("");
        }// end function

        public function get clip() : YouTubeClip
        {
            return this._clip;
        }// end function

        public function get renamed() : ISignal
        {
            return this._renamed;
        }// end function

        public function get account() : String
        {
            return "";
        }// end function

        public function get started() : ISignal
        {
            return this._started;
        }// end function

        public function get stopped() : ISignal
        {
            return this._stopped;
        }// end function

        public function get hidden() : ISignal
        {
            return this._hidden;
        }// end function

        public function get state() : YouTubePlayerState
        {
            return this.player.state;
        }// end function

        public function get stateChanged() : ISignal
        {
            return this._stateChanged;
        }// end function

        public function get isLoading() : Boolean
        {
            if (this.state != YouTubePlayerState.UNSTARTED)
            {
            }
            return this.state == YouTubePlayerState.BUFFERING;
        }// end function

        public function get isPlaying() : Boolean
        {
            return this.state == YouTubePlayerState.PLAYING;
        }// end function

        public function get isPaused() : Boolean
        {
            return this.state == YouTubePlayerState.PAUSED;
        }// end function

        public function get isClosed() : Boolean
        {
            return this._isClosed;
        }// end function

        public function get isHidden() : Boolean
        {
            return this._isHidden;
        }// end function

        public function get volume() : Number
        {
            return this.volumeController.volume;
        }// end function

        public function set volume(param1:Number) : void
        {
            if (!this._isClosed)
            {
                this.volumeController.volume = param1;
            }
            return;
        }// end function

        public function get masterVolume() : Number
        {
            return this.volumeController.masterVolume;
        }// end function

        public function set masterVolume(param1:Number) : void
        {
            if (!this._isClosed)
            {
                this.volumeController.masterVolume = param1;
            }
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

        public function get currentTime() : Number
        {
            return this.player.currentTime;
        }// end function

        public function get duration() : Number
        {
            return this.player.duration;
        }// end function

        public function get timeWatched() : Number
        {
            return this.state == YouTubePlayerState.PLAYING ? (this._timeWatched + getTimer() - this.lastPlayTime) : (this._timeWatched);
        }// end function

        public function get percentageWatched() : Number
        {
            return this.timeWatched / this.duration;
        }// end function

        public function get initiator() : UserIdentity
        {
            return this._initiator;
        }// end function

        public function setClip(param1:YouTubeClip, param2:Number, param3:UserIdentity, param4:Boolean = false) : void
        {
            this.startTime = param2;
            this.startPaused = param4;
            this._timeWatched = 0;
            this._clip = param1;
            this._initiator = param3;
            this.clipLoaded = false;
            return;
        }// end function

        public function start() : void
        {
            if (!this._isClosed)
            {
                if (!this.player.loaded)
                {
                    this.loadPlayer();
                }
                else
                {
                    this.doPlay();
                }
            }
            return;
        }// end function

        public function play() : void
        {
            if (!this._isClosed)
            {
            }
            if (this._clip)
            {
                this.startPaused = false;
                this.doPlay();
            }
            return;
        }// end function

        public function stop() : void
        {
            if (!this._isClosed)
            {
                this.player.pauseVideo();
            }
            return;
        }// end function

        public function close() : void
        {
            if (!this._isClosed)
            {
                this._isClosed = true;
                this.player.pauseVideo();
                this.removePlayerListeners();
            }
            return;
        }// end function

        public function dispose() : void
        {
            return;
        }// end function

        public function mute() : void
        {
            if (!this._isClosed)
            {
                this.volumeController.mute();
            }
            return;
        }// end function

        public function unmute() : void
        {
            if (!this._isClosed)
            {
                this.volumeController.unmute();
            }
            return;
        }// end function

        public function hide() : void
        {
            if (!this._isHidden)
            {
                this._isHidden = true;
                this._hidden.dispatch(this._isHidden);
            }
            return;
        }// end function

        public function unhide() : void
        {
            if (this._isHidden)
            {
                this._isHidden = false;
                this._hidden.dispatch(this._isHidden);
            }
            return;
        }// end function

        public function seekTo(param1:Number, param2:Boolean) : void
        {
            if (param2 == false)
            {
                this.player.seekTo(param1, true);
            }
            return;
        }// end function

        public function attachTo(param1:YouTubePlayerContainer) : void
        {
            if (this.player)
            {
                param1.player = this.player;
            }
            return;
        }// end function

        private function doPlay() : void
        {
            if (this._clip)
            {
                if (!this.clipLoaded)
                {
                    this.loadClip();
                }
                else
                {
                    if (!this.isStarted)
                    {
                        this.isStarted = true;
                        this._started.dispatch();
                    }
                    this.player.playVideo();
                }
            }
            return;
        }// end function

        private function loadPlayer() : void
        {
            this.player.addEventListener(YouTubePlayerEvent.READY, this.youTubePlayerReadyHandler);
            this.player.load();
            return;
        }// end function

        private function loadClip() : void
        {
            this.player.loadVideoById(this._clip.id, this.startTime / 1000);
            this.clipLoaded = true;
            return;
        }// end function

        private function youTubePlayerReadyHandler(event:Event) : void
        {
            this.player.removeEventListener(YouTubePlayerEvent.READY, this.youTubePlayerReadyHandler);
            this.seekTo(this.startTime, false);
            this.doPlay();
            return;
        }// end function

        private function addPlayerListeners() : void
        {
            this.player.addEventListener(YouTubePlayerEvent.STATE_CHANGE, this.playerStateChangeHandler);
            this.player.addEventListener(YouTubePlayerEvent.ERROR, this.playerErrorHandler);
            return;
        }// end function

        private function removePlayerListeners() : void
        {
            this.player.removeEventListener(YouTubePlayerEvent.STATE_CHANGE, this.playerStateChangeHandler);
            this.player.removeEventListener(YouTubePlayerEvent.ERROR, this.playerErrorHandler);
            return;
        }// end function

        private function playerStateChangeHandler(event:Event) : void
        {
            switch(this.state)
            {
                case YouTubePlayerState.UNSTARTED:
                {
                    if (this.player.currentTime > 0)
                    {
                        this.player.playVideo();
                    }
                    break;
                }
                case YouTubePlayerState.PLAYING:
                {
                    if (this.startPaused)
                    {
                        this.startPaused = false;
                        this.player.pauseVideo();
                    }
                    if (!this.isStarted)
                    {
                        this.isStarted = true;
                        this._started.dispatch();
                    }
                    this.volumeController.refresh();
                    break;
                }
                case YouTubePlayerState.ENDED:
                {
                    this._stopped.dispatch();
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (this.state == YouTubePlayerState.PLAYING)
            {
                this.lastPlayTime = getTimer();
            }
            else if (this.lastPlayerState == YouTubePlayerState.PLAYING)
            {
                this._timeWatched = this._timeWatched + (getTimer() - this.lastPlayTime);
            }
            this.lastPlayerState = this.state;
            this._stateChanged.dispatch();
            return;
        }// end function

        private function playerErrorHandler(event:Event) : void
        {
            this._stopped.dispatch();
            return;
        }// end function

    }
}
