package com.tinychat.model.social.chat.conversation.tinychat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.chat.message.factory.*;
    import com.tinychat.model.social.chat.spam.*;
    import com.tinychat.model.sounds.*;
    import com.tinychat.model.validation.chat.*;
    import com.tinychat.services.chat.*;
    import com.tinychat.services.chat.tinychat.*;
    import mx.collections.*;
    import org.osflash.signals.*;

    public class PublicChat extends AbstractChats
    {
        private var conversation:Conversation;
        private var giftNoticeService:MessageRecipient;
        private var actionNoticeService:MessageRecipient;
        private var mediaNoticeService:MessageRecipient;
        private var javascript:ApplicationJavascript;
        private var chatSound:ChatSoundEffect;
        private var giftSound:GiftSoundEffect;
        private static const similarMessageFilter:SimilarMessageFilter = new SimilarMessageFilter(1);
        private static const floodFilter:FloodFilter = new FloodFilter(3, 5000);
        private static const incomingFloodFilter:FloodFilter = new FloodFilter(10, 5000);

        public function PublicChat(param1:TinychatPublicChatService, param2:TinychatPublicUserNoticeService, param3:TinychatPublicActionNoticeService, param4:TinychatPublicMediaNoticeService, param5:TinychatCurrentUserChatMessageFactory, param6:ReceivePublicTinychatMessageFrom, param7:ApplicationJavascript, param8:ChatSoundEffect, param9:TinychatPublicGiftNoticeService, param10:GiftSoundEffect)
        {
            this.giftNoticeService = param9;
            this.actionNoticeService = param3;
            this.mediaNoticeService = param4;
            this.javascript = param7;
            this.chatSound = param8;
            this.giftSound = param10;
            this.giftNoticeService.received.add(this.giftNoticeReceivedHandler);
            this.actionNoticeService.received.add(this.noticeReceivedHandler);
            this.mediaNoticeService.received.add(this.noticeReceivedHandler);
            this.conversation = new Conversation(param1.maximumMessageLength);
            var _loc_11:* = new SpamFilters(this.Vector.<SpamFilter>([floodFilter, similarMessageFilter]));
            var _loc_12:* = new UserSpamFilters(this.Vector.<SpamFilter>([similarMessageFilter, incomingFloodFilter]), 30000, 10);
            super(param1, param2, param5, _loc_11, _loc_12, param6);
            return;
        }// end function

        public function get messages() : IList
        {
            return this.conversation.messages;
        }// end function

        public function get unreadMessageCountChanged() : ISignal
        {
            return this.conversation.unreadMessageCountChanged;
        }// end function

        public function markAllRead() : void
        {
            this.conversation.markAllRead();
            return;
        }// end function

        override public function postChat(param1:String, param2:Boolean = true) : void
        {
            submitChat(param1, null, this.conversation, param2);
            this.chatSound.play();
            return;
        }// end function

        override protected function incomingChatMessageReceivedHandler(param1:Conversation) : void
        {
            this.javascript.increasePublicChatUnreadMessageCount();
            this.chatSound.play();
            return;
        }// end function

        override protected function _hasConversation(param1:UserIdentity) : Boolean
        {
            return true;
        }// end function

        override protected function _getConversation(param1:UserIdentity) : Conversation
        {
            return this.conversation;
        }// end function

        private function noticeReceivedHandler(param1:Message, param2:UserIdentity) : void
        {
            this.conversation.addNotice(param1);
            return;
        }// end function

        private function giftNoticeReceivedHandler(param1:Message, param2:UserIdentity) : void
        {
            this.conversation.addNotice(param1);
            this.javascript.increasePublicChatUnreadMessageCount();
            this.giftSound.play();
            return;
        }// end function

    }
}
