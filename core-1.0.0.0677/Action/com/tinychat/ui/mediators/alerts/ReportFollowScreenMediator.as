package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.mediators.screen.*;

    public class ReportFollowScreenMediator extends ScreenMediator
    {
        public var statusMessage:String;
        public var view:ReportFollowScreen;

        public function ReportFollowScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Follow";
            this.view.statusLabelText = this.statusMessage;
            this.view.confirmLabel = "Close";
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            complete();
            return;
        }// end function

    }
}
