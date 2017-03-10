package com.tinychat.model.social.chat.message.factory
{
    import com.tinychat.model.social.chat.message.*;

    public interface CurrentUserChatMessageFactory
    {

        public function CurrentUserChatMessageFactory();

        function create(param1:String) : AbstractUserChatMessage;

    }
}
