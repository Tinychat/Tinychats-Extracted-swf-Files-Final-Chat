package com.tinychat.ui.mediators.social.chat
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.social.chat.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.user.*;
    import com.tinychat.ui.components.social.chat.*;
    import flash.events.*;
    import mx.collections.*;
    import org.robotlegs.mvcs.*;

    public class PrivateChatViewMediator extends Mediator
    {
        public var view:PrivateChatView;
        public var privateChats:ApplicationPrivateChats;
        public var usersProxy:RoomUsers;
        public var colors:ChatColors;
        public var isTinychatUser:IsTinychatUserGuard;
        public var roomSettingsProxy:RoomSettingsProxy;
        private var conversations:IList;

        public function PrivateChatViewMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.canInitiateChatPromptMessage = "Write here, then hit enter to send.";
            if (!this.isTinychatUser.approve())
            {
                this.view.cannotInitiateChatPromptMessage = "<a href=\'https://www.tinychat.com/start\' target=\'blank\'>" + "You must be logged into a Tinychat account to initiate private messaging.</a>";
            }
            else if (this.roomSettingsProxy.lurker)
            {
                this.view.cannotInitiateChatPromptMessage = "";
                this.view.chatInput.toolTip = "ToolTipBundle.chatInputLurkerRestricted";
                this.view.chatInput.editable = false;
            }
            this.view.title.text = "Private conversations:";
            this.view.dataProvider = this.privateChats;
            this.view.open(this.privateChats.currentConversation);
            eventMap.mapListener(this.view, Event.CHANGE, this.changeHandler, Event);
            this.view.chatInput.chatMessageSubmitted.add(this.messageSubmittedHandler);
            this.privateChats.currentConversationChanged.add(this.currentConversationChangedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.chatInput.chatMessageSubmitted.remove(this.messageSubmittedHandler);
            this.privateChats.currentConversationChanged.remove(this.currentConversationChangedHandler);
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            this.privateChats.currentConversation = this.view.selectedConversation;
            return;
        }// end function

        private function messageSubmittedHandler(param1:String) : void
        {
            this.privateChats.postChat(param1);
            return;
        }// end function

        private function currentConversationChangedHandler(param1:AbstractUserConversation) : void
        {
            this.view.open(param1);
            return;
        }// end function

    }
}
