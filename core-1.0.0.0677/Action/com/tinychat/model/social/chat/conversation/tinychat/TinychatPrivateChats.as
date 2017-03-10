package com.tinychat.model.social.chat.conversation.tinychat
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.captcha.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.message.factory.*;
    import com.tinychat.model.social.chat.spam.*;
    import com.tinychat.model.validation.chat.*;
    import com.tinychat.services.chat.tinychat.*;

    public class TinychatPrivateChats extends AbstractPrivateChats
    {
        private var isTinychatUser:IsTinychatUserGuard;
        private var captcha:ChatCaptcha;
        private static const similarMessageFilter:SimilarMessageFilter = new SimilarMessageFilter(1);
        private static const floodFilter:FloodFilter = new FloodFilter(3, 5000);
        private static const incomingFloodFilter:FloodFilter = new FloodFilter(10, 5000);

        public function TinychatPrivateChats(param1:TinychatPrivateChatService, param2:TinychatPrivateNoticeService, param3:TinychatCurrentUserChatMessageFactory, param4:ReceivePrivateTinychatMessageFrom, param5:IsTinychatUserGuard, param6:ChatCaptcha)
        {
            this.isTinychatUser = param5;
            this.captcha = param6;
            var _loc_7:* = new SpamFilters(this.Vector.<SpamFilter>([floodFilter, similarMessageFilter]));
            var _loc_8:* = new UserSpamFilters(this.Vector.<SpamFilter>([similarMessageFilter, incomingFloodFilter]), 30000, 10);
            super(param1, param2, param3, _loc_7, _loc_8, param4);
            return;
        }// end function

        override protected function createConversation(param1:UserIdentity, param2:uint) : AbstractUserConversation
        {
            return new TinychatUserConversation(param1 as User, param2, this.isTinychatUser, this.captcha);
        }// end function

    }
}
