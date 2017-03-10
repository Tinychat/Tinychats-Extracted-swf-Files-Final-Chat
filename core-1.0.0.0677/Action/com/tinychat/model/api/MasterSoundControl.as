package com.tinychat.model.api
{
    import flash.media.*;

    public interface MasterSoundControl extends SoundControl
    {

        public function MasterSoundControl();

        function addSoundControl(param1:MasterSoundControllable) : void;

        function removeSoundControl(param1:MasterSoundControllable) : void;

        function createSoundTransform() : SoundTransform;

    }
}
