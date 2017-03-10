package com.tinychat.services.chat.tinychat
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.services.chat.*;

    public class TinychatPublicActionNoticeService extends NoticeServiceBase
    {
        private var signal:PostActionNotice;

        public function TinychatPublicActionNoticeService(param1:PostActionNotice)
        {
            this.signal = param1;
            param1.add(this.signalHandler);
            return;
        }// end function

        private function signalHandler(param1:String, param2:uint) : void
        {
            dispatchReceived(new ColoredMessage(param1, param2), null);
            return;
        }// end function

    }
}
