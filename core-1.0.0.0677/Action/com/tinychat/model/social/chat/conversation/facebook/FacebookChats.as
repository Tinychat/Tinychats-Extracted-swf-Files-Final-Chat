package com.tinychat.model.social.chat.conversation.facebook
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.message.factory.*;
    import com.tinychat.services.chat.facebook.*;

    public class FacebookChats extends AbstractPrivateChats
    {

        public function FacebookChats(param1:FacebookChatService, param2:FacebookNoticeService, param3:FacebookCurrentUserChatMessageFactory)
        {
            super(param1, param2, param3);
            return;
        }// end function

        override protected function createConversation(param1:UserIdentity, param2:uint) : AbstractUserConversation
        {
            return new FacebookUserConversation(param1 as RenameableUser, param2);
        }// end function

    }
}
