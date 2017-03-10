package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.proxies.*;
    import com.tinychat.model.settings.*;
    import org.robotlegs.mvcs.*;

    public class EnhancedBroadcastDeviceApplicationSettingsCommand extends Command
    {
        public var settings:ApplicationSettings;
        public var flashCookie:FlashCookieProxy;
        public var deviceProxy:EnhancedBroadcastDeviceProxy;

        public function EnhancedBroadcastDeviceApplicationSettingsCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.settings.add(new AecEnabledApplicationSetting(this.flashCookie, this.deviceProxy));
            return;
        }// end function

    }
}
