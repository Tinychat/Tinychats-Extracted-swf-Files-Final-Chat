package com.tinychat.controller.commands.social.network.mqtt
{
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.conversation.mqtt.*;
    import org.robotlegs.mvcs.*;

    public class RegisterMqttChatListenersCommand extends Command
    {
        public var privateChats:ApplicationPrivateChats;
        public var chats:MqttChats;

        public function RegisterMqttChatListenersCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.privateChats.addSource(this.chats);
            return;
        }// end function

    }
}
