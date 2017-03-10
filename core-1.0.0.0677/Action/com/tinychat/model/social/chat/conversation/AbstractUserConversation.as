package com.tinychat.model.social.chat.conversation
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class AbstractUserConversation extends Conversation implements RenameableUser
    {
        private var user:RenameableUser;

        public function AbstractUserConversation(param1:RenameableUser, param2:uint)
        {
            this.user = param1;
            super(param2);
            return;
        }// end function

        public function get id() : String
        {
            return this.user.id;
        }// end function

        public function get name() : String
        {
            return this.user.name;
        }// end function

        public function get renamed() : ISignal
        {
            return this.user.renamed;
        }// end function

        public function get account() : String
        {
            return this.user.account;
        }// end function

    }
}
