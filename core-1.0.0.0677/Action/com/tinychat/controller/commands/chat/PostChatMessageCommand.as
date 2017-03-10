package com.tinychat.controller.commands.chat
{
    import com.tinychat.model.social.chat.conversation.tinychat.*;

    public class PostChatMessageCommand extends Object
    {
        private var publicChat:PublicChat;
        private var message:String;
        private var floodFilter:Boolean;

        public function PostChatMessageCommand(param1:PublicChat, param2:String, param3:Boolean)
        {
            this.publicChat = param1;
            this.message = param2;
            this.floodFilter = param3;
            return;
        }// end function

        public function execute() : void
        {
            this.publicChat.postChat(this.message, this.floodFilter);
            return;
        }// end function

    }
}
