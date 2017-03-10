package com.tinychat.services.chat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.message.*;
    import org.osflash.signals.*;

    public class NoticeReceived extends Signal
    {

        public function NoticeReceived()
        {
            super(Message, UserIdentity);
            return;
        }// end function

    }
}
