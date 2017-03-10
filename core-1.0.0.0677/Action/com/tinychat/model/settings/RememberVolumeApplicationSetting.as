package com.tinychat.model.settings
{
    import com.tinychat.model.cookie.*;

    public class RememberVolumeApplicationSetting extends AbstractFlashCookieApplicationSetting
    {

        public function RememberVolumeApplicationSetting(param1:FlashCookieProxy, param2:String)
        {
            super(param1, param2);
            return;
        }// end function

        override public function get value() : Object
        {
            return flashCookie.rememberApplicationVolume;
        }// end function

        override public function set value(param1:Object) : void
        {
            if (param1 is Boolean)
            {
                flashCookie.rememberApplicationVolume = param1;
            }
            return;
        }// end function

    }
}
