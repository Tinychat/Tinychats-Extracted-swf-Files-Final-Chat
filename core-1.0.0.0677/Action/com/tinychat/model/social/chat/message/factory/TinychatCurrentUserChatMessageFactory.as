package com.tinychat.model.social.chat.message.factory
{
    import com.tinychat.model.social.chat.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.user.*;

    public class TinychatCurrentUserChatMessageFactory extends Object implements CurrentUserChatMessageFactory
    {
        private var users:Users;
        private var colors:ChatColors;

        public function TinychatCurrentUserChatMessageFactory(param1:RoomUsers, param2:ChatColors)
        {
            this.users = param1;
            this.colors = param2;
            return;
        }// end function

        public function create(param1:String) : AbstractUserChatMessage
        {
            return new TinychatUserChatMessage(this.users.currentUser, param1, this.colors.current);
        }// end function

    }
}
