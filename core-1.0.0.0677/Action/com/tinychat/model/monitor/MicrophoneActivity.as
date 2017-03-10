package com.tinychat.model.monitor
{
    import flash.media.*;

    public class MicrophoneActivity extends Object implements Activity
    {
        private var _microphone:Microphone;

        public function MicrophoneActivity(param1:Microphone)
        {
            this._microphone = param1;
            return;
        }// end function

        public function set microphone(param1:Microphone) : void
        {
            this._microphone = param1;
            return;
        }// end function

        public function get activityLevel() : Number
        {
            if (this._microphone)
            {
            }
            if (!isNaN(this._microphone.silenceLevel))
            {
                return this._microphone.activityLevel / 100;
            }
            return 0;
        }// end function

    }
}
