package com.tinychat.services.chat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.message.*;
    import org.osflash.signals.*;

    public class NoticeServiceBase extends Object implements MessageRecipient
    {
        private var _received:NoticeReceived;

        public function NoticeServiceBase()
        {
            this._received = new NoticeReceived();
            return;
        }// end function

        public function get received() : ISignal
        {
            return this._received;
        }// end function

        protected function dispatchReceived(param1:Message, param2:UserIdentity) : void
        {
            this._received.dispatch(param1, param2);
            return;
        }// end function

    }
}
