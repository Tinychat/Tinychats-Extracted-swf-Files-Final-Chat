package com.tinychat.model.sounds
{
    import flash.media.*;

    public class SoundTransformVolumeControl extends AbstractVolumeControl implements MasterSoundControllable
    {
        private var _source:Object;
        private var soundTransform:SoundTransform;
        private var _masterVolume:Number;
        private static const SOUNDTRANSFORM_PROPERTY:String = "soundTransform";

        public function SoundTransformVolumeControl(param1:Object = null, param2:Number = 1, param3:Number = 1)
        {
            this._source = param1;
            this.soundTransform = new SoundTransform();
            this._masterVolume = param2;
            super(param3);
            return;
        }// end function

        public function set source(param1:Object) : void
        {
            if (this._source != param1)
            {
                this._source = param1;
                this.updateVolume();
            }
            return;
        }// end function

        public function get masterVolume() : Number
        {
            return this._masterVolume;
        }// end function

        public function set masterVolume(param1:Number) : void
        {
            if (this._masterVolume != param1)
            {
                this._masterVolume = normalizeVolumeValue(param1);
                this.updateVolume();
            }
            return;
        }// end function

        override protected function updateVolume() : void
        {
            if (this._source)
            {
                this.soundTransform.volume = this._masterVolume * volume;
                this._source[SOUNDTRANSFORM_PROPERTY] = this.soundTransform;
            }
            return;
        }// end function

    }
}
