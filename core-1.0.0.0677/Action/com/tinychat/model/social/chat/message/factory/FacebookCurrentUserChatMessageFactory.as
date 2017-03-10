package com.tinychat.model.social.chat.message.factory
{
    import com.tinychat.model.social.chat.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.network.facebook.*;

    public class FacebookCurrentUserChatMessageFactory extends Object implements CurrentUserChatMessageFactory
    {
        private var facebookLogin:FacebookLoginProxy;
        private var colors:ChatColors;

        public function FacebookCurrentUserChatMessageFactory(param1:FacebookLoginProxy, param2:ChatColors)
        {
            this.facebookLogin = param1;
            this.colors = param2;
            return;
        }// end function

        public function create(param1:String) : AbstractUserChatMessage
        {
            return new FacebookUserChatMessage(this.facebookLogin.facebookUser, param1, this.colors.current);
        }// end function

    }
}
