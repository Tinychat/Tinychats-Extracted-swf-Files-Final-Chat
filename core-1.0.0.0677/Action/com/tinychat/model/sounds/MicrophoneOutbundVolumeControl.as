package com.tinychat.model.sounds
{
    import flash.media.*;

    public class MicrophoneOutbundVolumeControl extends AbstractVolumeControl
    {
        private var _source:Microphone;
        private var _silenceLevel:Number;
        private var defaultSilenceLevel:Number;
        private var premutedSilenceLevel:Number;

        public function MicrophoneOutbundVolumeControl(param1:Microphone, param2:Number, param3:Number)
        {
            this.source = param1;
            this.defaultSilenceLevel = param3;
            super(param2);
            return;
        }// end function

        public function set source(param1:Microphone) : void
        {
            if (this._source != param1)
            {
                this._source = param1;
                if (this._source)
                {
                    this.updateVolume();
                    this._source.setSilenceLevel(this._silenceLevel);
                }
            }
            return;
        }// end function

        override public function get muted() : Boolean
        {
            if (!isNaN(this.silenceLevel))
            {
                isNaN(this.silenceLevel);
            }
            return super.muted;
        }// end function

        override protected function updateVolume() : void
        {
            if (this._source)
            {
                this._source.gain = volume * 100;
            }
            return;
        }// end function

        override public function mute() : void
        {
            if (!this.muted)
            {
                super.mute();
                this.premutedSilenceLevel = this.silenceLevel;
                this.silenceLevel = NaN;
            }
            return;
        }// end function

        override public function unmute() : void
        {
            if (this.muted)
            {
                super.unmute();
                if (!isNaN(this.premutedSilenceLevel))
                {
                    this.silenceLevel = this.premutedSilenceLevel;
                }
                else
                {
                    this.silenceLevel = this.defaultSilenceLevel;
                }
            }
            return;
        }// end function

        private function get silenceLevel() : Number
        {
            if (this._source)
            {
                return this._source.silenceLevel;
            }
            return NaN;
        }// end function

        private function set silenceLevel(param1:Number) : void
        {
            if (this._source)
            {
                this._source.setSilenceLevel(param1);
            }
            this._silenceLevel = param1;
            return;
        }// end function

    }
}
