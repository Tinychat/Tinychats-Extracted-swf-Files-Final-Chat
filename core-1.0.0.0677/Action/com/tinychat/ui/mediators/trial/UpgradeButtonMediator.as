package com.tinychat.ui.mediators.trial
{
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.ui.components.trial.*;
    import com.tinychat.ui.mediators.general.*;
    import flash.events.*;

    public class UpgradeButtonMediator extends ButtonMediator
    {
        public var openUpgradeUrl:OpenUpgradeUrl;
        private var view:UpgradeButton;

        public function UpgradeButtonMediator(param1:UpgradeButton)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.label = "Upgrade now!";
            return;
        }// end function

        override protected function clickHandler(event:MouseEvent) : void
        {
            this.openUpgradeUrl.dispatch();
            return;
        }// end function

    }
}
