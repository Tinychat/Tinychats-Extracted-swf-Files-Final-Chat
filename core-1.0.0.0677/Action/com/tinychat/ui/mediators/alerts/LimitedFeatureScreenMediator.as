package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.mediators.screen.*;

    public class LimitedFeatureScreenMediator extends ScreenMediator
    {
        public var view:LimitedFeatureScreen;
        public var openUpgradeUrl:OpenUpgradeUrl;

        public function LimitedFeatureScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.title = "This is a Tinychat Subscription Feature";
            this.view.statusLabelText = "Fullscreen is only available to Tinychat Subscribers.";
            this.view.confirmLabel = "Upgrade now!";
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            this.openUpgradeUrl.dispatch();
            complete();
            return;
        }// end function

    }
}
