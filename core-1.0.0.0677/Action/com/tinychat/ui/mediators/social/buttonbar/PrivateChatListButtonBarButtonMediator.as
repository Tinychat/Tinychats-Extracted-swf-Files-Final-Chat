package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import mx.events.*;
    import org.robotlegs.mvcs.*;

    public class PrivateChatListButtonBarButtonMediator extends Mediator
    {
        private var chatListFocusSynced:Boolean = false;
        public var view:PrivateChatListButtonBarButton;
        public var privateChats:ApplicationPrivateChats;
        public var javascript:ApplicationJavascript;

        public function PrivateChatListButtonBarButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            if (!this.chatListFocusSynced)
            {
                this.javascript.privateChatListFocusChange(this.view.selected);
                this.chatListFocusSynced = true;
            }
            if (!this.view.selected)
            {
                this.privateChats.conversationUnreadMessageCountChanged.add(this.unreadMessageCountChangedHandler);
            }
            this.updateUnreadMessageCountDisplays(this.privateChats.conversationsWithUnreadMessagesCount);
            eventMap.mapListener(this.view, FlexEvent.VALUE_COMMIT, this.valueCommitHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.privateChats.conversationUnreadMessageCountChanged.remove(this.unreadMessageCountChangedHandler);
            return;
        }// end function

        private function valueCommitHandler(event:FlexEvent) : void
        {
            if (this.view.selected)
            {
                this.updateUnreadMessageCountDisplays(0);
                this.privateChats.conversationUnreadMessageCountChanged.remove(this.unreadMessageCountChangedHandler);
            }
            else
            {
                this.updateUnreadMessageCountDisplays(this.privateChats.conversationsWithUnreadMessagesCount);
                this.privateChats.conversationUnreadMessageCountChanged.add(this.unreadMessageCountChangedHandler);
            }
            this.javascript.privateChatListFocusChange(this.view.selected);
            return;
        }// end function

        private function unreadMessageCountChangedHandler(param1:AbstractUserConversation, param2:uint) : void
        {
            this.updateUnreadMessageCountDisplays(this.privateChats.conversationsWithUnreadMessagesCount);
            return;
        }// end function

        private function updateUnreadMessageCountDisplays(param1:uint) : void
        {
            this.view.count = param1;
            this.updateTooltip(param1);
            return;
        }// end function

        private function updateTooltip(param1:uint) : void
        {
            if (param1 > 1)
            {
                this.view.toolTip = "Private chat: " + param1.toString() + " unread conversations.";
            }
            else if (param1 == 1)
            {
                this.view.toolTip = "Private chat: one unread conversation.";
            }
            else
            {
                this.view.toolTip = "Private chat";
            }
            return;
        }// end function

    }
}
