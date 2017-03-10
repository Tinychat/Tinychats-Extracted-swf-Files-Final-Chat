package com.tinychat.controller.guards.chat
{
    import com.tinychat.model.cookie.*;

    public class ReceiveTinychatPrivateMessagesGuard extends Object implements IGuard
    {
        private var cookie:FlashCookieProxy;

        public function ReceiveTinychatPrivateMessagesGuard(param1:FlashCookieProxy)
        {
            this.cookie = param1;
            return;
        }// end function

        public function approve() : Boolean
        {
            return this.cookie.receivePms;
        }// end function

    }
}
