package com.tinychat.controller.commands.user
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.conversation.facebook.*;
    import com.tinychat.model.social.chat.conversation.mqtt.*;
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import com.tinychat.ui.mediators.social.buttonbar.signals.*;
    import org.robotlegs.mvcs.*;

    public class PrivateChatWithUserCommand extends Command
    {
        public var user:RenameableUser;
        public var privateChats:ApplicationPrivateChats;
        public var selectSocialButtonBarButton:SelectSocialButtonBarButton;

        public function PrivateChatWithUserCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:AbstractPrivateChats = null;
            switch(true)
            {
                case this.user is FacebookUser:
                {
                    _loc_1 = injector.getInstance(FacebookChats);
                    break;
                }
                case this.user is MqttUser:
                {
                    _loc_1 = injector.getInstance(MqttChats);
                    break;
                }
                case this.user is User:
                {
                    _loc_1 = injector.getInstance(TinychatPrivateChats);
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (_loc_1)
            {
                this.privateChats.currentConversation = _loc_1.getConversation(this.user);
                this.selectSocialButtonBarButton.dispatch(SocialButtonBar.PRIVATE_CHAT_LIST_CONTAINER);
            }
            return;
        }// end function

    }
}
