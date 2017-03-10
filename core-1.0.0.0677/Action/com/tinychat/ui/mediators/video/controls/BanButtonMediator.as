package com.tinychat.ui.mediators.video.controls
{
    import com.tinychat.controller.commands.settings.signals.*;
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.video.controls.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class BanButtonMediator extends Mediator
    {
        public var view:BanButton;
        public var user:UserIdentity;
        public var banUser:BanUser;
        public var confirmBan:ConfirmBan;

        public function BanButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.toolTip = "ToolTipBundle.banButton";
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            if (event.ctrlKey)
            {
                this.banUser.dispatch(this.user);
            }
            else
            {
                this.confirmBan.dispatch(this.user);
            }
            return;
        }// end function

    }
}
