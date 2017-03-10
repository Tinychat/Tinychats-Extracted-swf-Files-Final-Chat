package com.tinychat.model.sounds
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.cookie.*;

    public class ApplicationVolume extends AbstractApplicationVolume implements MasterSoundControl
    {
        private var volumeControllers:Vector.<MasterSoundControllable>;

        public function ApplicationVolume(param1:FlashCookieProxy, param2:Number = 1)
        {
            this.volumeControllers = new Vector.<MasterSoundControllable>;
            super(param1, param2);
            return;
        }// end function

        override public function addSoundControl(param1:MasterSoundControllable) : void
        {
            this.volumeControllers.push(param1);
            param1.masterVolume = volume;
            return;
        }// end function

        override public function removeSoundControl(param1:MasterSoundControllable) : void
        {
            var _loc_2:* = this.volumeControllers.indexOf(param1);
            if (_loc_2 != -1)
            {
                this.volumeControllers.splice(_loc_2, 1);
            }
            return;
        }// end function

        override protected function updateVolume() : void
        {
            super.updateVolume();
            this.volumeControllers.forEach(function (param1:MasterSoundControllable, param2:int, param3:Vector.<MasterSoundControllable>) : void
            {
                param1.masterVolume = volume;
                return;
            }// end function
            );
            return;
        }// end function

    }
}
