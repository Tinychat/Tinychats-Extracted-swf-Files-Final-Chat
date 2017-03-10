package com.tinychat.controller.commands.trial
{
    import com.tinychat.model.constants.*;
    import com.tinychat.model.javascript.*;
    import flash.net.*;
    import org.robotlegs.mvcs.*;

    public class OpenUpgradeUrlCommand extends Command
    {
        public var javascript:ApplicationJavascript;

        public function OpenUpgradeUrlCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            navigateToURL(new URLRequest(ApplicationConstants.UPGRADE_URL), "_blank");
            return;
        }// end function

    }
}
