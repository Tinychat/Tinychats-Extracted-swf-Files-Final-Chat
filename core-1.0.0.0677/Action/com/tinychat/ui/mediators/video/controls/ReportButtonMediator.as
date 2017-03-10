package com.tinychat.ui.mediators.video.controls
{
    import com.tinychat.controller.commands.settings.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.report.*;
    import com.tinychat.ui.components.video.controls.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class ReportButtonMediator extends Mediator
    {
        public var view:ReportButton;
        public var broadcast:StreamBroadcast;
        public var confirmReportBroadcast:ConfirmReportUser;
        public var proxy:ReportUsersProxy;

        public function ReportButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.selected = this.proxy.isReported(this.broadcast);
            this.updateToolTip();
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            eventMap.mapListener(this.view, Event.CHANGE, this.changeHandler, Event);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            if (!this.view.selected)
            {
                this.confirmReportBroadcast.dispatch(this.broadcast);
            }
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            this.updateToolTip();
            return;
        }// end function

        private function updateToolTip() : void
        {
            if (!this.view.selected)
            {
                this.view.toolTip = "ToolTipBundle.reportButton";
            }
            else
            {
                this.view.toolTip = "ToolTipBundle.reportButtonSelected";
            }
            return;
        }// end function

    }
}
