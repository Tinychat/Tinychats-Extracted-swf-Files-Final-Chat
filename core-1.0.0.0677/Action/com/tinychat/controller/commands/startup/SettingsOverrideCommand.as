package com.tinychat.controller.commands.startup
{
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.flashvars.*;
    import org.robotlegs.mvcs.*;

    public class SettingsOverrideCommand extends Command
    {
        public var flashvars:FlashvarsProxy;
        public var cookie:FlashCookieProxy;

        public function SettingsOverrideCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_2:String = null;
            var _loc_1:* = this.flashvars.settingsOverride;
            if (_loc_1)
            {
                try
                {
                    for (_loc_2 in _loc_1)
                    {
                        
                        if (this.cookie.hasOwnProperty(_loc_2))
                        {
                            this.cookie[_loc_2] = _loc_1[_loc_2];
                        }
                    }
                }
                catch (error:Error)
                {
                }
            }
            return;
        }// end function

    }
}
