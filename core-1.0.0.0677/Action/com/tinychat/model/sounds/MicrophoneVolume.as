package com.tinychat.model.sounds
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import flash.events.*;
    import flash.utils.*;
    import org.osflash.signals.*;

    public class MicrophoneVolume extends Object implements Muteable
    {
        private var broadcasts:RoomCameraBroadcasts;
        private var currentBroadcast:CameraBroadcast;
        private var _muted:Boolean;
        private var forceMuteTimeout:Timer;
        private var _mutedChanged:Signal;
        private var _forceMutedChanged:Signal;

        public function MicrophoneVolume(param1:RoomCameraBroadcasts)
        {
            this._mutedChanged = new Signal(Boolean);
            this._forceMutedChanged = new Signal(Boolean);
            this.broadcasts = param1;
            this.broadcasts.started.add(this.broadcastStartedHandler);
            this.broadcasts.stopped.add(this.broadcastStoppedHandler);
            return;
        }// end function

        public function get muted() : Boolean
        {
            return this._muted;
        }// end function

        public function get mutedChanged() : ISignal
        {
            return this._mutedChanged;
        }// end function

        public function get forceMuted() : Boolean
        {
            if (this.forceMuteTimeout)
            {
            }
            return this.forceMuteTimeout.running;
        }// end function

        public function get forceMutedChanged() : ISignal
        {
            return this._forceMutedChanged;
        }// end function

        public function mute() : void
        {
            this.setMuted(true);
            return;
        }// end function

        public function unmute() : void
        {
            this.setMuted(false);
            return;
        }// end function

        public function forceMute(param1:Number) : void
        {
            if (!this.forceMuteTimeout)
            {
                this.forceMuteTimeout = new Timer(param1, 1);
                this.forceMuteTimeout.addEventListener(TimerEvent.TIMER_COMPLETE, this.forceMuteTimeoutComplete);
            }
            else
            {
                this.forceMuteTimeout.reset();
            }
            this.forceMuteTimeout.start();
            this.updateVolume();
            this._forceMutedChanged.dispatch(true);
            return;
        }// end function

        private function forceMuteTimeoutComplete(event:TimerEvent) : void
        {
            this.updateVolume();
            this._forceMutedChanged.dispatch(false);
            return;
        }// end function

        private function broadcastStartedHandler(param1:Broadcast) : void
        {
            this.currentBroadcast = CameraBroadcast(param1);
            this.updateVolume();
            return;
        }// end function

        private function broadcastStoppedHandler(param1:Broadcast) : void
        {
            this.currentBroadcast = null;
            return;
        }// end function

        private function setMuted(param1:Boolean) : void
        {
            if (!this.forceMuted)
            {
                this._muted = param1;
                this.updateVolume();
                this._mutedChanged.dispatch(param1);
            }
            return;
        }// end function

        private function updateVolume() : void
        {
            if (this.currentBroadcast)
            {
                if (!this._muted)
                {
                }
                if (this.forceMuted)
                {
                    this.currentBroadcast.mute();
                }
                else
                {
                    this.currentBroadcast.unmute();
                }
            }
            return;
        }// end function

    }
}
