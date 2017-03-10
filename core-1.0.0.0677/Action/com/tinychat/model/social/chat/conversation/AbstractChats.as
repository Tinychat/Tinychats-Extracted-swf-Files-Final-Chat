package com.tinychat.model.social.chat.conversation
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.chat.message.factory.*;
    import com.tinychat.model.social.chat.spam.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.services.chat.*;
    import flash.errors.*;
    import org.osflash.signals.*;

    public class AbstractChats extends Object
    {
        private var chatService:ChatService;
        private var noticeService:MessageRecipient;
        private var messageFactory:CurrentUserChatMessageFactory;
        private var outgoingSpamFilters:SpamFilters;
        private var incomingSpamFilters:UserSpamFilters;
        private var validator:IdentityValidation;
        private var _receiveNotices:Boolean;
        private var _receiveNoticesChanged:Signal;

        public function AbstractChats(param1:ChatService, param2:MessageRecipient, param3:CurrentUserChatMessageFactory, param4:SpamFilters = null, param5:UserSpamFilters = null, param6:IdentityValidation = null)
        {
            this.chatService = param1;
            this.noticeService = param2;
            this.messageFactory = param3;
            this.outgoingSpamFilters = param4;
            this.incomingSpamFilters = param5;
            this.validator = param6;
            this.chatService.received.add(this.chatReceivedHandler);
            this.noticeService.received.add(this.noticeReceivedHandler);
            this._receiveNoticesChanged = new Signal(Boolean);
            this.receiveNotices = true;
            return;
        }// end function

        public function get receiveNotices() : Boolean
        {
            return this._receiveNotices;
        }// end function

        public function set receiveNotices(param1:Boolean) : void
        {
            if (this._receiveNotices != param1)
            {
                this._receiveNotices = param1;
                if (param1)
                {
                    this.noticeService.received.add(this.noticeReceivedHandler);
                }
                else
                {
                    this.noticeService.received.remove(this.noticeReceivedHandler);
                }
                this._receiveNoticesChanged.dispatch(param1);
            }
            return;
        }// end function

        public function get receiveNoticesChanged() : ISignal
        {
            return this._receiveNoticesChanged;
        }// end function

        public function postChat(param1:String, param2:Boolean = true) : void
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        protected function get maximumMessageLength() : uint
        {
            return this.chatService.com.tinychat.services.chat:MessageLengthRestriction::maximumMessageLength;
        }// end function

        protected function submitChat(param1:String, param2:UserIdentity, param3:Conversation, param4:Boolean = true) : void
        {
            var _loc_5:* = this.messageFactory.create(param1);
            if (param4)
            {
            }
            if (this.allowOutgoingChatMessage(_loc_5))
            {
                this.chatService.send(_loc_5.text, param2);
                param3.addChat(_loc_5);
            }
            else
            {
                param3.addNotice(new ColoredMessage("*Please don\'t spam/flood the chat.*", 13715510));
            }
            return;
        }// end function

        protected function incomingChatMessageReceivedHandler(param1:Conversation) : void
        {
            return;
        }// end function

        protected function allowOutgoingChatMessage(param1:AbstractUserChatMessage) : Boolean
        {
            if (param1.text != "")
            {
                if (this.outgoingSpamFilters)
                {
                }
            }
            return this.outgoingSpamFilters.filter(param1);
        }// end function

        protected function allowIncomingChatMessage(param1:AbstractUserChatMessage) : Boolean
        {
            if (this.validator)
            {
            }
            if (this.validator.isValid(param1))
            {
                this.validator.isValid(param1);
                if (this.incomingSpamFilters)
                {
                }
            }
            return this.incomingSpamFilters.filter(param1);
        }// end function

        protected function _hasConversation(param1:UserIdentity) : Boolean
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        protected function _getConversation(param1:UserIdentity) : Conversation
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        private function chatReceivedHandler(param1:AbstractUserChatMessage, param2:UserIdentity) : void
        {
            var _loc_3:Conversation = null;
            if (this.allowIncomingChatMessage(param1))
            {
                _loc_3 = this._getConversation(param2);
                _loc_3.addChat(param1);
                this.incomingChatMessageReceivedHandler(_loc_3);
                ;
            }
            return;
        }// end function

        private function noticeReceivedHandler(param1:Message, param2:UserIdentity) : void
        {
            if (this._hasConversation(param2))
            {
                this._getConversation(param2).addNotice(param1);
            }
            return;
        }// end function

    }
}
