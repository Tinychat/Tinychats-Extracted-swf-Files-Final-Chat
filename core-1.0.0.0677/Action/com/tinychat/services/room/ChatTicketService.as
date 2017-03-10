package com.tinychat.services.room
{
    import com.tinychat.services.*;
    import org.osflash.signals.*;

    public class ChatTicketService extends AbstractJsonLoaderService
    {
        private var _success:Signal;

        public function ChatTicketService()
        {
            super("https://tinychat.com/cauth");
            this._success = new Signal();
            return;
        }// end function

        public function load(param1:String) : void
        {
            setUrlParameters({room:param1, t:new Date().getTime()});
            makeGetRequest();
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        override protected function parse(param1:Object)
        {
            return param1;
        }// end function

        override protected function finish(param1) : void
        {
            this._success.dispatch(param1);
            return;
        }// end function

        override protected function failureHandler(param1:String) : void
        {
            super.failureHandler(param1);
            return;
        }// end function

    }
}
