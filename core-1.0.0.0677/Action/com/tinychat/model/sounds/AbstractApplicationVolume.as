package com.tinychat.model.sounds
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.cookie.*;
    import flash.media.*;

    public class AbstractApplicationVolume extends AbstractVolumeControl implements MasterSoundControl
    {
        private var flashCookieProxy:FlashCookieProxy;

        public function AbstractApplicationVolume(param1:FlashCookieProxy, param2:Number = 1)
        {
            this.flashCookieProxy = param1;
            if (param1.rememberApplicationVolume)
            {
            }
            if (!isNaN(param1.applicationVolume))
            {
                param2 = param1.applicationVolume;
            }
            super(param2);
            return;
        }// end function

        public function addSoundControl(param1:MasterSoundControllable) : void
        {
            return;
        }// end function

        public function removeSoundControl(param1:MasterSoundControllable) : void
        {
            return;
        }// end function

        public function createSoundTransform() : SoundTransform
        {
            return new SoundTransform(volume);
        }// end function

        override protected function updateVolume() : void
        {
            if (this.flashCookieProxy.rememberApplicationVolume)
            {
                this.flashCookieProxy.applicationVolume = volume;
            }
            return;
        }// end function

    }
}
