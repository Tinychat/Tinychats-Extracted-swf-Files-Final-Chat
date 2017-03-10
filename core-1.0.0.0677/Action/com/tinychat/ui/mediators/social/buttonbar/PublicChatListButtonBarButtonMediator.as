package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import mx.events.*;
    import org.robotlegs.mvcs.*;

    public class PublicChatListButtonBarButtonMediator extends Mediator
    {
        private var chatListFocusSynced:Boolean = false;
        public var view:PublicChatListButtonBarButton;
        public var javascript:ApplicationJavascript;
        public var publicChat:PublicChat;
        public var selected:CountMessage;

        public function PublicChatListButtonBarButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.syncMessages();
            var _loc_1:* = this.javascript.publicChatUnreadMessageCount;
            this.view.count = _loc_1;
            this.updateTooltip();
            eventMap.mapListener(this.view, FlexEvent.VALUE_COMMIT, this.changeHandler, FlexEvent);
            this.publicChat.unreadMessageCountChanged.add(this.unreadMessageCountChanged);
            this.selected.selectedChanged.add(this.unreadMessageCountChanged);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.publicChat.unreadMessageCountChanged.remove(this.unreadMessageCountChanged);
            this.selected.selectedChanged.remove(this.unreadMessageCountChanged);
            return;
        }// end function

        private function changeHandler(event:FlexEvent) : void
        {
            this.syncMessages();
            return;
        }// end function

        private function syncMessages() : void
        {
            if (!this.view.selected)
            {
            }
            if (this.selected.selected)
            {
                this.selectedHandler();
            }
            this.javascript.publicChatListFocusChange(this.view.selected);
            return;
        }// end function

        private function selectedHandler() : void
        {
            this.view.count = 0;
            this.updateTooltip();
            this.publicChat.markAllRead();
            return;
        }// end function

        private function unreadMessageCountChanged(param1:uint) : void
        {
            if (!this.view.selected)
            {
            }
            if (this.selected.selected)
            {
                this.selectedHandler();
            }
            else
            {
                this.view.count = param1;
            }
            return;
        }// end function

        private function updateTooltip() : void
        {
            if (!this.view.selected)
            {
            }
            if (this.view.count > 0)
            {
                if (this.view.count == 1)
                {
                    this.view.toolTip = "Public chat: one unread chat message.";
                }
                else
                {
                    this.view.toolTip = "Public chat: " + this.view.count.toString() + " unread chat messages.";
                }
            }
            else
            {
                this.view.toolTip = "Public chat";
            }
            return;
        }// end function

    }
}
