package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.conversation.facebook.*;
    import org.robotlegs.mvcs.*;

    public class RegisterFacebookChatListenersCommand extends Command
    {
        public var privateChat:ApplicationPrivateChats;
        public var facebookChats:FacebookChats;

        public function RegisterFacebookChatListenersCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.privateChat.addSource(this.facebookChats);
            return;
        }// end function

    }
}
