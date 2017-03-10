package com.tinychat.ui.mediators.trial
{
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.trial.*;
    import com.tinychat.ui.mediators.screen.*;

    public class TrialResizePopupMediator extends ScreenMediator
    {
        public var user:Identity;
        public var view:TrialResizePopup;
        public var startTrial:StartTrialMode;

        public function TrialResizePopupMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Upgrade your Tinychat Membership";
            this.view.statusLabelText = "Get High Quality Video, Fullscreen, Premium Membership Badges, and more!";
            this.view.confirmLabel = "Try Maximize video Now";
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
            this.startTrial.dispatch(StartTrialMode.RESIZE_VIDEO, this.user);
            return;
        }// end function

        private function canceledHandler() : void
        {
            canceled();
            return;
        }// end function

    }
}
