package com.tinychat.services.report
{
    import com.tinychat.services.*;

    public class NickLoggingService extends AbstractUrlLoaderService
    {
        private const URL:String = "https://tinychat.com/log.png";

        public function NickLoggingService()
        {
            super(this.URL);
            return;
        }// end function

        public function send(param1:String, param2:String, param3:String, param4:String) : void
        {
            setUrlParameters({nickFrom:param1, nickTo:param2, rtmp:param3, roomName:param4});
            makeGetRequest(false, false);
            return;
        }// end function

    }
}
