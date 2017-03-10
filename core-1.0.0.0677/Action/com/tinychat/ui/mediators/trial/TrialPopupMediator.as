package com.tinychat.ui.mediators.trial
{
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.ui.components.trial.*;
    import com.tinychat.ui.mediators.screen.*;

    public class TrialPopupMediator extends ScreenMediator
    {
        public var view:TrialPopup;
        public var startTrial:StartTrialMode;

        public function TrialPopupMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Upgrade your Tinychat Membership";
            this.view.statusLabelText = "Get High Quality Video, Fullscreen, Premium Membership Badges, and more!";
            this.view.confirmLabel = "Try Fullscreen Now";
            this.view.cancelLabel = "Close";
            this.view.confirmed.add(this.confirmedHandler);
            this.view.canceled.add(this.canceledHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            this.view.canceled.remove(this.canceledHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            complete();
            this.startTrial.dispatch(StartTrialMode.FULL_SCREEN);
            return;
        }// end function

        private function canceledHandler() : void
        {
            canceled();
            return;
        }// end function

    }
}
