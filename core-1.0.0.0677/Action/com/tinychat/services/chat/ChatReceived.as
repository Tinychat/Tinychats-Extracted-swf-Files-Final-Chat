package com.tinychat.services.chat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;
    import com.tinychat.model.social.chat.message.*;

    public class ChatReceived extends AbstractReadOnlySignal
    {

        public function ChatReceived()
        {
            super(AbstractUserChatMessage);
            return;
        }// end function

        public function dispatch(param1:AbstractUserChatMessage, param2:UserIdentity) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
