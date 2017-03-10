package com.tinychat.controller.commands.social.chat
{
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import org.robotlegs.mvcs.*;

    public class RegisterTinychatChatListenersCommand extends Command
    {
        public var privateChat:ApplicationPrivateChats;
        public var tinychatPrivateChats:TinychatPrivateChats;

        public function RegisterTinychatChatListenersCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.privateChat.addSource(this.tinychatPrivateChats);
            return;
        }// end function

    }
}
