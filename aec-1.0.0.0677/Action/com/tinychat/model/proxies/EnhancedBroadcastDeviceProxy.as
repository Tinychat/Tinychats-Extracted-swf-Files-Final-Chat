package com.tinychat.model.proxies
{
    import com.tinychat.model.cookie.*;
    import flash.events.*;
    import flash.media.*;

    public class EnhancedBroadcastDeviceProxy extends StandardBroadcastDeviceProxy
    {

        public function EnhancedBroadcastDeviceProxy(param1:FlashCookieProxy)
        {
            super(param1);
            return;
        }// end function

        public function get selectedMicrophoneIsEnhanced() : Boolean
        {
            return this.isEnhanced(_selectedMicrophone);
        }// end function

        public function forceMicrophoneUpdate() : void
        {
            if (_selectedMicrophone)
            {
                _selectedMicrophone.removeEventListener(StatusEvent.STATUS, this.statusHandler);
                _selectedMicrophone = null;
            }
            _selectedMicrophoneChanged.dispatch();
            return;
        }// end function

        override protected function setUpMicrophone(param1:Microphone) : void
        {
            var _loc_2:MicrophoneEnhancedOptions = null;
            if (this.isEnhanced(param1))
            {
                _loc_2 = new MicrophoneEnhancedOptions();
                _loc_2.autoGain = false;
                _loc_2.echoPath = 128;
                _loc_2.nonLinearProcessing = true;
                param1.enhancedOptions = _loc_2;
            }
            super.setUpMicrophone(param1);
            return;
        }// end function

        override protected function get selectedMicrophoneIsValid() : Boolean
        {
            if (flashCookie.aecEnabled)
            {
                if (this.selectedMicrophoneIsEnhanced)
                {
                }
                return super.selectedMicrophoneIsValid;
            }
            return super.selectedMicrophoneIsValid;
        }// end function

        override protected function getMicrophoneByName(param1:String) : Microphone
        {
            var _loc_2:Microphone = null;
            if (_selectedMicrophone)
            {
                _selectedMicrophone.removeEventListener(StatusEvent.STATUS, this.statusHandler);
            }
            if (hasMicrophoneWithName(param1))
            {
                if (flashCookie.aecEnabled)
                {
                    _loc_2 = Microphone.getEnhancedMicrophone(getMicrophoneIndex(param1));
                }
                if (_loc_2)
                {
                    _loc_2.addEventListener(StatusEvent.STATUS, this.statusHandler, false, 0, true);
                }
                else
                {
                    _loc_2 = super.getMicrophoneByName(param1);
                }
            }
            return _loc_2;
        }// end function

        private function isEnhanced(param1:Microphone) : Boolean
        {
            if (param1)
            {
            }
            return param1.enhancedOptions;
        }// end function

        private function statusHandler(event:StatusEvent) : void
        {
            if (event.code == "Microphone.Unavailable")
            {
                _selectedMicrophoneChanged.dispatch();
            }
            return;
        }// end function

    }
}
