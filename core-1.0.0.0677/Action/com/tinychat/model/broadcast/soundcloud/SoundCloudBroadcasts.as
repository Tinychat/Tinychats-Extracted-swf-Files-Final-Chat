package com.tinychat.model.broadcast.soundcloud
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.soundcloud.*;
    import flash.system.*;

    public class SoundCloudBroadcasts extends BroadcastsBase implements MediaBroadcasts
    {
        private var connection:ImmutableConnection;
        private var _currentBroadcast:SoundCloudBroadcast;
        private var applicationVolume:MasterSoundControl;
        private var cookie:FlashCookieProxy;
        private var player:SoundCloudTrackPlayer;

        public function SoundCloudBroadcasts(param1:ImmutableConnection, param2:MasterSoundControl, param3:FlashCookieProxy)
        {
            Security.allowDomain("*.soundcloud.com");
            Security.loadPolicyFile("https://api.soundcloud.com/crossdomain.xml");
            this.connection = param1;
            this.applicationVolume = param2;
            this.cookie = param3;
            param1.connectionClosed.add(this.connectionClosedHandler);
            return;
        }// end function

        public function get currentBroadcast() : MediaBroadcast
        {
            return this._currentBroadcast;
        }// end function

        public function start(param1:Media, param2:Number, param3:UserIdentity, param4:Boolean = false) : void
        {
            var _loc_5:* = param1 as SoundCloudTrack;
            if (_loc_5)
            {
                if (!this._currentBroadcast)
                {
                    if (!this.player)
                    {
                        this.player = new SoundCloudTrackPlayer();
                    }
                    this._currentBroadcast = new SoundCloudBroadcast(this.player);
                    this._currentBroadcast.stopped.add(this.stoppedHandler);
                    this.applicationVolume.addSoundControl(this._currentBroadcast);
                    _start(this.currentBroadcast);
                }
                this._currentBroadcast.loadTrack(_loc_5, param2, param3, param4);
                this._currentBroadcast.start();
            }
            return;
        }// end function

        public function stop() : void
        {
            if (this.currentBroadcast)
            {
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

    }
}
