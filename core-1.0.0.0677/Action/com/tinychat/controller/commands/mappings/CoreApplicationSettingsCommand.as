package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.settings.*;
    import org.robotlegs.mvcs.*;

    public class CoreApplicationSettingsCommand extends Command
    {
        public var settings:ApplicationSettings;
        public var flashCookie:FlashCookieProxy;

        public function CoreApplicationSettingsCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapValue(OpenGraphShareApplicationSetting, new OpenGraphShareApplicationSetting(this.flashCookie, "Social ON"));
            injector.mapValue(OpenGraphRemindMeApplicationSetting, new OpenGraphRemindMeApplicationSetting("Notify me every time posts are added to my Facebook."));
            this.settings.add(new ConfirmBansApplicationSetting(this.flashCookie, "Confirm bans"));
            this.settings.add(new PlayYouTubeVideosApplicationSetting(this.flashCookie, "Play YouTube videos"));
            this.settings.add(new ReceivePmsApplicationSetting(this.flashCookie, "Receive PMs"));
            this.settings.add(new RememberVolumeApplicationSetting(this.flashCookie, "Remember volume"));
            return;
        }// end function

    }
}
