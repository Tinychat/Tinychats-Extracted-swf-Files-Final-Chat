package com.tinychat.services.chat.tinychat
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.services.chat.*;

    public class TinychatPublicMediaNoticeService extends NoticeServiceBase
    {
        private var signal:PostMediaNotice;

        public function TinychatPublicMediaNoticeService(param1:PostMediaNotice)
        {
            this.signal = param1;
            param1.add(this.signalHandler);
            return;
        }// end function

        private function signalHandler(param1:String, param2:User) : void
        {
            dispatchReceived(new TinychatUserChatMessage(param2, "*" + param1 + "*", 0), null);
            return;
        }// end function

    }
}
