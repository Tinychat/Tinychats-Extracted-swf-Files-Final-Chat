package com.tinychat.model.proxies
{
    import com.tinychat.model.cookie.*;
    import flash.media.*;
    import org.osflash.signals.*;

    public class StandardBroadcastDeviceProxy extends Object implements BroadcastDeviceProxy
    {
        protected var _selectedMicrophone:Microphone;
        protected var _selectedCameraName:String;
        protected var _selectedMicrophoneName:String;
        protected var _selectedCameraChanged:Signal;
        protected var _selectedMicrophoneChanged:Signal;
        protected var _codec:String;
        protected var flashCookie:FlashCookieProxy;
        private var _pushToTalk:Boolean;

        public function StandardBroadcastDeviceProxy(param1:FlashCookieProxy)
        {
            this.flashCookie = param1;
            this._selectedCameraName = param1.selectedCameraName;
            this._selectedMicrophoneName = param1.selectedMicrophoneName;
            this._selectedCameraChanged = new Signal();
            this._selectedMicrophoneChanged = new Signal();
            this._codec = SoundCodec.NELLYMOSER;
            return;
        }// end function

        public function get selectedCamera() : Camera
        {
            var _loc_2:Camera = null;
            var _loc_1:* = Camera.names.indexOf(this._selectedCameraName);
            if (_loc_1 != -1)
            {
                _loc_2 = Camera.getCamera(_loc_1.toString());
                this.setUpCamera(_loc_2);
                return _loc_2;
            }
            return null;
        }// end function

        public function get selectedCameraName() : String
        {
            return this._selectedCameraName;
        }// end function

        public function set selectedCameraName(param1:String) : void
        {
            if (this._selectedCameraName != param1)
            {
                this._selectedCameraName = param1;
                if (param1 != "")
                {
                    this.flashCookie.selectedCameraName = param1;
                }
                this._selectedCameraChanged.dispatch();
            }
            return;
        }// end function

        public function get selectedCameraChanged() : ISignal
        {
            return this._selectedCameraChanged;
        }// end function

        public function get selectedMicrophone() : Microphone
        {
            if (!this.selectedMicrophoneIsValid)
            {
                this.updateMicrophone();
            }
            return this._selectedMicrophone;
        }// end function

        public function get selectedMicrophoneName() : String
        {
            return this._selectedMicrophoneName;
        }// end function

        public function set selectedMicrophoneName(param1:String) : void
        {
            if (this._selectedMicrophoneName != param1)
            {
                if (this.selectedMicrophoneIsValid)
                {
                    this.selectedMicrophone.gain = 50;
                }
                this._selectedMicrophoneName = param1;
                if (param1 != "")
                {
                    this.flashCookie.selectedMicrophoneName = param1;
                }
                this.updateMicrophone();
                this._selectedMicrophoneChanged.dispatch();
            }
            return;
        }// end function

        public function set microphoneCodec(param1:String) : void
        {
            if (param1 == SoundCodec.SPEEX)
            {
                this._codec = param1;
            }
            else
            {
                this._codec = SoundCodec.NELLYMOSER;
            }
            return;
        }// end function

        public function clearMicrophoneSelection() : void
        {
            this.selectedMicrophoneName = "";
            return;
        }// end function

        public function get selectedMicrophoneChanged() : ISignal
        {
            return this._selectedMicrophoneChanged;
        }// end function

        public function get hasSelectedCamera() : Boolean
        {
            if (this.selectedCameraName != BroadcastDeviceConstants.MICROPHONE_ONLY)
            {
            }
            return this.selectedCamera;
        }// end function

        public function get hasSelectedMicrophone() : Boolean
        {
            if (this.selectedMicrophoneName != BroadcastDeviceConstants.CAMERA_ONLY)
            {
            }
            return this.selectedMicrophoneIsValid;
        }// end function

        public function get hasSelectedDevices() : Boolean
        {
            if (this.hasSelectedMicrophone)
            {
            }
            return this.hasSelectedCamera;
        }// end function

        protected function get selectedMicrophoneIsValid() : Boolean
        {
            if (this._selectedMicrophone)
            {
            }
            return this._selectedMicrophone.name == this._selectedMicrophoneName;
        }// end function

        protected function hasMicrophoneWithName(param1:String) : Boolean
        {
            return this.getMicrophoneIndex(param1) != -1;
        }// end function

        protected function getMicrophoneByName(param1:String) : Microphone
        {
            if (this.hasMicrophoneWithName(param1))
            {
                return Microphone.getMicrophone(this.getMicrophoneIndex(param1));
            }
            return null;
        }// end function

        protected function getMicrophoneIndex(param1:String) : int
        {
            return Microphone.names.indexOf(param1);
        }// end function

        protected function setUpCamera(param1:Camera) : void
        {
            param1.setLoopback(true);
            return;
        }// end function

        protected function setUpMicrophone(param1:Microphone) : void
        {
            param1.codec = this._codec;
            param1.setUseEchoSuppression(true);
            param1.rate = 11;
            param1.setLoopBack(false);
            param1.framesPerPacket = 1;
            return;
        }// end function

        private function updateMicrophone() : void
        {
            this._selectedMicrophone = this.getMicrophoneByName(this._selectedMicrophoneName);
            if (this._selectedMicrophone)
            {
                this.setUpMicrophone(this._selectedMicrophone);
            }
            return;
        }// end function

    }
}
