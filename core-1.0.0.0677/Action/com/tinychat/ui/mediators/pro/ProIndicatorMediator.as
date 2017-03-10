package com.tinychat.ui.mediators.pro
{
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.ui.components.pro.*;
    import com.tinychat.ui.mediators.general.*;
    import flash.events.*;

    public class ProIndicatorMediator extends ButtonMediator
    {
        public var isPaidUser:IsPaidUserGuard;
        public var openUpgradeUrl:OpenUpgradeUrl;

        public function ProIndicatorMediator(param1:ProIndicator)
        {
            super(param1);
            return;
        }// end function

        override protected function clickHandler(event:MouseEvent) : void
        {
            if (!this.isPaidUser.approve())
            {
                this.openUpgradeUrl.dispatch();
            }
            return;
        }// end function

    }
}
