package com.tinychat.model.youtube
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.vendors.youtube.*;
    import flash.events.*;
    import flash.utils.*;

    public class YouTubeBroadcasts extends BroadcastsBase implements MediaBroadcasts
    {
        private var player:YouTubePlayer;
        private var connection:ImmutableConnection;
        private var _currentBroadcast:YouTubeBroadcast;
        private var applicationVolume:MasterSoundControl;
        private var volumeController:YouTubePlayerVolumeControl;
        private var cookie:FlashCookieProxy;
        private var watchAction:WatchActionManager;
        private var timeWatchedTimer:Timer;
        private static const TIME_WATCHED_DELAY:Number = 5000;
        private static const OG_MINIMUM_WATCH_TIME:Number = 10000;

        public function YouTubeBroadcasts(param1:YouTubePlayer, param2:ImmutableConnection, param3:MasterSoundControl, param4:FlashCookieProxy, param5:WatchActionManager)
        {
            this.player = param1;
            this.connection = param2;
            this.applicationVolume = param3;
            this.cookie = param4;
            this.watchAction = param5;
            this.volumeController = new YouTubePlayerVolumeControl(param1);
            param2.connectionClosed.add(this.connectionClosedHandler);
            return;
        }// end function

        public function get currentBroadcast() : MediaBroadcast
        {
            return this._currentBroadcast;
        }// end function

        public function start(param1:Media, param2:Number, param3:UserIdentity, param4:Boolean = false) : void
        {
            var _loc_5:* = param1 as YouTubeClip;
            if (_loc_5)
            {
            }
            if (this.cookie.playYouTubeVideos)
            {
                if (!this._currentBroadcast)
                {
                    this._currentBroadcast = new YouTubeBroadcast(this.player, this.volumeController);
                    this._currentBroadcast.stopped.add(this.stoppedHandler);
                    this.timeWatchedTimer = new Timer(TIME_WATCHED_DELAY);
                    this.timeWatchedTimer.addEventListener(TimerEvent.TIMER, this.timeWatchedHandler);
                    this.applicationVolume.addSoundControl(this._currentBroadcast);
                    _start(this.currentBroadcast);
                }
                this.timeWatchedTimer.reset();
                this.timeWatchedTimer.start();
                this._currentBroadcast.setClip(_loc_5, param2, param3, param4);
                this._currentBroadcast.start();
            }
            return;
        }// end function

        public function stop() : void
        {
            if (this.currentBroadcast)
            {
                if (this._currentBroadcast.percentageWatched < 0.5)
                {
                    this.watchAction.withdraw(this._currentBroadcast);
                }
                else if (this._currentBroadcast.percentageWatched < 0.99)
                {
                    this.watchAction.update(this._currentBroadcast);
                }
                this.timeWatchedTimer.removeEventListener(TimerEvent.TIMER, this.timeWatchedHandler);
                this.applicationVolume.removeSoundControl(this._currentBroadcast);
                this._currentBroadcast.stopped.remove(this.stoppedHandler);
                _stop(this.currentBroadcast);
                this._currentBroadcast = null;
            }
            return;
        }// end function

        private function stoppedHandler() : void
        {
            this.stop();
            return;
        }// end function

        private function connectionClosedHandler() : void
        {
            this.stop();
            return;
        }// end function

        private function timeWatchedHandler(event:TimerEvent) : void
        {
            if (this._currentBroadcast.timeWatched > OG_MINIMUM_WATCH_TIME)
            {
                this.watchAction.post(this._currentBroadcast);
                this.timeWatchedTimer.removeEventListener(TimerEvent.TIMER, this.timeWatchedHandler);
            }
            return;
        }// end function

    }
}
