package com.tinychat.model.social.chat.conversation.mqtt
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.message.factory.*;
    import com.tinychat.model.social.chat.spam.*;
    import com.tinychat.services.chat.mqtt.*;

    public class MqttChats extends AbstractPrivateChats
    {
        private static const similarMessageFilter:SimilarMessageFilter = new SimilarMessageFilter(1);
        private static const floodFilter:FloodFilter = new FloodFilter(3, 5000);

        public function MqttChats(param1:MqttChatService, param2:MqttNoticeService, param3:MqttCurrentUserChatMessageFactory)
        {
            var _loc_4:* = new SpamFilters(this.Vector.<SpamFilter>([floodFilter, similarMessageFilter]));
            var _loc_5:* = new UserSpamFilters(this.Vector.<SpamFilter>([similarMessageFilter]));
            super(param1, param2, param3, _loc_4, _loc_5);
            return;
        }// end function

        override protected function createConversation(param1:UserIdentity, param2:uint) : AbstractUserConversation
        {
            return new MqttUserConversation(param1 as RenameableUser, param2);
        }// end function

    }
}
