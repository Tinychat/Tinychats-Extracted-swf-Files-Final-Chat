package com.tinychat.ui.mediators.trial
{
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.ui.components.trial.*;
    import org.robotlegs.mvcs.*;

    public class TrialOverlayMediator extends Mediator
    {
        public var view:TrialOverlay;
        public var isPaidUser:IsPaidUserGuard;
        public var openUpgradeUrl:OpenUpgradeUrl;

        public function TrialOverlayMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.statusLabelText = "Video effects are only available to Tinychat Subscribers.";
            this.view.confirmLabel = "Upgrade now!";
            this.view.cancelLabel = "Ok";
            this.isPaidUserChangeHandler(this.isPaidUser.approve());
            this.isPaidUser.addChangeListener(this.isPaidUserChangeHandler);
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.isPaidUser.removeChangeListener(this.isPaidUserChangeHandler);
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            this.openUpgradeUrl.dispatch();
            return;
        }// end function

        private function isPaidUserChangeHandler(param1:Boolean) : void
        {
            this.view.includeInLayout = !param1;
            this.view.visible = !param1;
            return;
        }// end function

    }
}
