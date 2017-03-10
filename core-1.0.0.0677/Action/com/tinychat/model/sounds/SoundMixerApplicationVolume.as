package com.tinychat.model.sounds
{
    import com.tinychat.model.cookie.*;
    import flash.media.*;

    public class SoundMixerApplicationVolume extends AbstractApplicationVolume
    {

        public function SoundMixerApplicationVolume(param1:FlashCookieProxy, param2:Number = 1)
        {
            super(param1, param2);
            return;
        }// end function

        override protected function updateVolume() : void
        {
            super.updateVolume();
            SoundMixer.soundTransform = createSoundTransform();
            return;
        }// end function

    }
}
