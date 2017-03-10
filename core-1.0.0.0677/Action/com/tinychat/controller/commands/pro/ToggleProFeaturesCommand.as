package com.tinychat.controller.commands.pro
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.nick.*;
    import com.tinychat.model.social.chat.*;
    import com.tinychat.ui.components.social.chat.*;
    import org.robotlegs.mvcs.*;

    public class ToggleProFeaturesCommand extends Command
    {
        public var isPaidUser:IsPaidUserGuard;
        public var colors:ChatColors;

        public function ToggleProFeaturesCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:Class = null;
            var _loc_2:uint = 0;
            if (this.isPaidUser.approve())
            {
                this.colors.add(ProChatColors.COLORS);
                if (ProChatColors.COLORS.length > 0)
                {
                    _loc_2 = Math.round(Math.random() * (ProChatColors.COLORS.length - 1));
                    this.colors.current = ProChatColors.COLORS[_loc_2];
                }
                _loc_1 = ProNickFormatter;
            }
            else
            {
                this.colors.remove(ProChatColors.COLORS);
                _loc_1 = RegularNickFormatter;
            }
            injector.mapSingletonOf(NickFormatter, _loc_1);
            return;
        }// end function

    }
}
