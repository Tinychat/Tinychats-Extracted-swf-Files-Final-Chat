package com.tinychat.ui.mediators.moderator
{
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.model.api.*;

    public class ConfirmReportBroadcastScreenMediator extends ConfirmScreenMediator
    {
        public var user:UserIdentity;
        public var report:ReportUser;

        public function ConfirmReportBroadcastScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.title = "Report user";
            view.messageDisplay.text = "Are you sure you want to report " + this.user.name + "?";
            view.confirmLabel = "Report";
            view.cancelLabel = "Cancel";
            return;
        }// end function

        override protected function confirmedHandler() : void
        {
            this.report.dispatch(this.user);
            super.confirmedHandler();
            return;
        }// end function

    }
}
