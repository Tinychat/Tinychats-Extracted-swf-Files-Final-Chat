package com.tinychat.model.settings
{
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.proxies.*;

    public class AecEnabledApplicationSetting extends AbstractFlashCookieApplicationSetting
    {
        private var deviceProxy:EnhancedBroadcastDeviceProxy;

        public function AecEnabledApplicationSetting(param1:FlashCookieProxy, param2:EnhancedBroadcastDeviceProxy)
        {
            super(param1, "Enable acoustic echo cancellation");
            this.deviceProxy = param2;
            return;
        }// end function

        override public function get value() : Object
        {
            return flashCookie.aecEnabled;
        }// end function

        override public function set value(param1:Object) : void
        {
            if (this.value != param1)
            {
            }
            if (param1 is Boolean)
            {
                flashCookie.aecEnabled = param1;
                this.deviceProxy.forceMicrophoneUpdate();
            }
            return;
        }// end function

    }
}
