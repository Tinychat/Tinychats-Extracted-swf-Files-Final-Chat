package com.tinychat.ui.mediators.video.controls
{
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.video.controls.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class PrivateMessageButtonMediator extends Mediator
    {
        public var view:PrivateMessageButton;
        public var broadcast:StreamBroadcast;
        public var privateChat:PrivateChatWithUser;

        public function PrivateMessageButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            this.view.toolTip = "ToolTipBundle.privateMessageButton";
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.privateChat.dispatch(this.broadcast);
            return;
        }// end function

    }
}
