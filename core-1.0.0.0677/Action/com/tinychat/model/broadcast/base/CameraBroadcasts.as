package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.streamoptions.*;
    import com.tinychat.model.proxies.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.sounds.*;
    import com.tinychat.model.user.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import org.osflash.signals.*;

    public class CameraBroadcasts extends UserBroadcastsBase
    {
        private var connection:ConnectionCallbackReceiver;
        private var users:Users;
        private var broadcastFactory:CameraBroadcastFactory;
        private var _currentBroadcast:CameraBroadcast;
        private var devices:BroadcastDeviceProxy;
        private var _disabled:Boolean;
        private var disabledTimer:Timer;
        private var _disabledChanged:Signal;

        public function CameraBroadcasts(param1:Users, param2:ConnectionCallbackReceiver, param3:CameraBroadcastFactory)
        {
            this.users = param1;
            this.connection = param2;
            this.broadcastFactory = param3;
            this._disabledChanged = new Signal(Boolean);
            super(param1);
            return;
        }// end function

        public function get disabled() : Boolean
        {
            return this._disabled;
        }// end function

        public function get disabledChanged() : ISignal
        {
            return this._disabledChanged;
        }// end function

        public function get currentBroadcast() : CameraBroadcast
        {
            return this._currentBroadcast;
        }// end function

        public function get isBroadcasting() : Boolean
        {
            if (this._currentBroadcast)
            {
            }
            return !this._currentBroadcast.isClosed;
        }// end function

        public function get isBroadcastingVideo() : Boolean
        {
            if (this.isBroadcasting)
            {
            }
            return this._currentBroadcast.isBroadcastingVideo;
        }// end function

        public function start(param1:BroadcastDeviceProxy, param2:MicrophoneOutbundVolumeControl, param3:StreamOptions) : void
        {
            var _loc_4:User = null;
            var _loc_5:NetStream = null;
            if (!this.disabled)
            {
            }
            if (!this._currentBroadcast)
            {
                this.devices = param1;
                _loc_4 = this.users.currentUser;
                _loc_5 = this.connection.newStream();
                param3.apply(_loc_5);
                this._currentBroadcast = this.broadcastFactory.newInstance(_loc_4, _loc_5, param1.selectedCamera, param1.selectedMicrophone, param2);
                param1.selectedCameraChanged.add(this.selectedCameraChangedHandler);
                param1.selectedMicrophoneChanged.add(this.selectedMicrophoneChangedHandler);
                _start(this._currentBroadcast);
            }
            return;
        }// end function

        public function stop(param1:Boolean = false, param2:Number = 0) : void
        {
            if (this.isBroadcasting)
            {
                this.devices.selectedCameraChanged.remove(this.selectedCameraChangedHandler);
                this.devices.selectedMicrophoneChanged.remove(this.selectedMicrophoneChangedHandler);
                this.devices = null;
                _stop(this._currentBroadcast, !param1);
                this._currentBroadcast = null;
                this.disable(param2);
            }
            return;
        }// end function

        override protected function userRemovedHandler(param1:UserIdentity) : void
        {
            if (this._currentBroadcast)
            {
            }
            if (param1.id == this._currentBroadcast.id)
            {
                this.stop();
            }
            else
            {
                super.userRemovedHandler(param1);
            }
            return;
        }// end function

        private function selectedCameraChangedHandler() : void
        {
            this._currentBroadcast.switchCamera(this.devices.selectedCamera);
            return;
        }// end function

        private function selectedMicrophoneChangedHandler() : void
        {
            this._currentBroadcast.switchMicrophone(this.devices.selectedMicrophone);
            return;
        }// end function

        private function setDisabled(param1:Boolean) : void
        {
            if (this._disabled != param1)
            {
                this._disabled = param1;
                this._disabledChanged.dispatch(param1);
            }
            return;
        }// end function

        private function disable(param1:Number) : void
        {
            if (param1 > 0)
            {
                if (!this.disabledTimer)
                {
                    this.disabledTimer = new Timer(param1, 1);
                    this.disabledTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.disabledTimerCompleteHandler);
                }
                else
                {
                    this.disabledTimer.delay = param1;
                    this.disabledTimer.reset();
                }
                this.setDisabled(true);
                this.disabledTimer.start();
            }
            return;
        }// end function

        private function disabledTimerCompleteHandler(event:TimerEvent) : void
        {
            this.setDisabled(false);
            return;
        }// end function

    }
}
