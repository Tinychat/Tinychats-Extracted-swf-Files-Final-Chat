package com.tinychat.model.social.chat.conversation.tinychat
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.captcha.*;
    import com.tinychat.model.social.chat.conversation.*;

    public class TinychatUserConversation extends AbstractUserConversation
    {
        private var isTinychatUser:IsTinychatUserGuard;
        private var captcha:ChatCaptcha;

        public function TinychatUserConversation(param1:User, param2:uint, param3:IsTinychatUserGuard, param4:ChatCaptcha)
        {
            this.isTinychatUser = param3;
            this.captcha = param4;
            super(param1, param2);
            return;
        }// end function

        override public function get canSend() : Boolean
        {
            if (!this.isTinychatUser.approve())
            {
                this.isTinychatUser.approve();
            }
            return length > 0;
        }// end function

    }
}
