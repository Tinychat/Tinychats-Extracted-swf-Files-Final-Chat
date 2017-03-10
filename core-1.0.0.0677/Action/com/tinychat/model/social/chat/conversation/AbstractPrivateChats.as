package com.tinychat.model.social.chat.conversation
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.chat.message.factory.*;
    import com.tinychat.model.social.chat.spam.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.services.chat.*;
    import flash.errors.*;
    import mx.collections.*;
    import org.osflash.signals.*;

    public class AbstractPrivateChats extends AbstractChats
    {
        private var _conversations:IdItemList;
        private var _selectedConversation:AbstractUserConversation;
        private var _selectedConversationChanged:Signal;
        private var _conversationUnreadMessageCountChanged:Signal;

        public function AbstractPrivateChats(param1:ChatService, param2:MessageRecipient, param3:CurrentUserChatMessageFactory, param4:SpamFilters = null, param5:UserSpamFilters = null, param6:IdentityValidation = null)
        {
            super(param1, param2, param3, param4, param5, param6);
            this._conversations = new IdItemList();
            this._selectedConversationChanged = new Signal(AbstractUserConversation);
            this._conversationUnreadMessageCountChanged = new Signal(AbstractUserConversation, uint);
            return;
        }// end function

        public function get conversations() : IList
        {
            return this._conversations;
        }// end function

        public function get conversationUnreadMessageCountChanged() : ISignal
        {
            return this._conversationUnreadMessageCountChanged;
        }// end function

        public function get selectedConversation() : AbstractUserConversation
        {
            return this._selectedConversation;
        }// end function

        public function set selectedConversation(param1:AbstractUserConversation) : void
        {
            if (this._selectedConversation != param1)
            {
            }
            if (this.hasConversation(param1))
            {
                this._selectedConversation = this.getConversation(param1);
                this._selectedConversationChanged.dispatch(this._selectedConversation);
            }
            return;
        }// end function

        public function get selectedConversationChanged() : ISignal
        {
            return this._selectedConversationChanged;
        }// end function

        public function get conversationsWithUnreadMessagesCount() : uint
        {
            var _loc_3:AbstractUserConversation = null;
            var _loc_1:uint = 0;
            var _loc_2:uint = 0;
            while (_loc_2 < this._conversations.length)
            {
                
                _loc_3 = AbstractUserConversation(this._conversations.getItemAt(_loc_2));
                if (_loc_3.unreadMessageCount > 0)
                {
                    _loc_1 = _loc_1 + 1;
                }
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

        public function hasConversation(param1:UserIdentity) : Boolean
        {
            return this._hasConversation(param1);
        }// end function

        public function getConversation(param1:UserIdentity) : AbstractUserConversation
        {
            return this._getConversation(param1) as AbstractUserConversation;
        }// end function

        override public function postChat(param1:String, param2:Boolean = true) : void
        {
            if (this._selectedConversation)
            {
                submitChat(param1, this._selectedConversation, this._selectedConversation, param2);
            }
            return;
        }// end function

        override protected function incomingChatMessageReceivedHandler(param1:Conversation) : void
        {
            this._conversationUnreadMessageCountChanged.dispatch(param1, 1);
            return;
        }// end function

        protected function createConversation(param1:UserIdentity, param2:uint) : AbstractUserConversation
        {
            throw new IllegalOperationError("Must be over-ridden in sub-class.");
        }// end function

        override protected function _hasConversation(param1:UserIdentity) : Boolean
        {
            return this._conversations.hasItemWith(param1);
        }// end function

        override protected function _getConversation(param1:UserIdentity) : Conversation
        {
            var _loc_2:Conversation = null;
            if (this._hasConversation(param1))
            {
                _loc_2 = this._conversations.getItemBy(param1) as Conversation;
            }
            else
            {
                _loc_2 = this.createConversation(param1, maximumMessageLength);
                this._conversations.addItem(_loc_2);
            }
            return _loc_2;
        }// end function

    }
}
