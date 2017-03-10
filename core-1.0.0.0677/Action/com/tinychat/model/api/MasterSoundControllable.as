package com.tinychat.model.api
{

    public interface MasterSoundControllable extends SoundControl
    {

        public function MasterSoundControllable();

        function get masterVolume() : Number;

        function set masterVolume(param1:Number) : void;

    }
}
