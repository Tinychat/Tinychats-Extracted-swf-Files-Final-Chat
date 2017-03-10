package com.tinychat.ui.mediators.social.chat
{
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import com.tinychat.ui.components.social.chat.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class ReceiveNoticesCheckboxMediator extends Mediator
    {
        public var view:ReceiveNoticesCheckbox;
        public var publicChat:PublicChat;

        public function ReceiveNoticesCheckboxMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.selected = this.publicChat.receiveNotices;
            this.view.label = "Notifications";
            this.publicChat.receiveNoticesChanged.add(this.receiveNoticesChangedHandler);
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.publicChat.receiveNotices = this.view.selected;
            return;
        }// end function

        private function receiveNoticesChangedHandler(param1:Boolean) : void
        {
            this.view.selected = param1;
            return;
        }// end function

    }
}
