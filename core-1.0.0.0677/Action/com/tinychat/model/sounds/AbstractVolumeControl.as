package com.tinychat.model.sounds
{
    import flash.errors.*;
    import org.osflash.signals.*;

    public class AbstractVolumeControl extends Object implements SoundControl
    {
        private var _volume:Number;
        private var premutedVolume:Number;
        private var defaultVolume:Number;
        private var _volumeChanged:Signal;

        public function AbstractVolumeControl(param1:Number = 1)
        {
            if (param1 > 0)
            {
                this.defaultVolume = param1;
            }
            else
            {
                this.defaultVolume = 1;
            }
            this._volumeChanged = new Signal();
            this.volume = param1;
            return;
        }// end function

        public function get volume() : Number
        {
            return this._volume;
        }// end function

        public function set volume(param1:Number) : void
        {
            if (this._volume != param1)
            {
                this._volume = this.normalizeVolumeValue(param1);
                this.updateVolume();
                this._volumeChanged.dispatch(this._volume);
            }
            return;
        }// end function

        public function get volumeChanged() : ISignal
        {
            return this._volumeChanged;
        }// end function

        public function get muted() : Boolean
        {
            return this.volume == 0;
        }// end function

        public function mute() : void
        {
            if (!this.muted)
            {
                this.premutedVolume = this.volume;
                this.volume = 0;
            }
            return;
        }// end function

        public function unmute() : void
        {
            if (this.muted)
            {
                if (!isNaN(this.premutedVolume))
                {
                }
                if (this.premutedVolume != 0)
                {
                    this.volume = this.premutedVolume;
                }
                else
                {
                    this.volume = this.defaultVolume;
                }
            }
            return;
        }// end function

        protected function updateVolume() : void
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        protected function normalizeVolumeValue(param1:Number) : Number
        {
            return isNaN(param1) ? (1) : (Math.max(0, Math.min(param1, 1)));
        }// end function

    }
}
