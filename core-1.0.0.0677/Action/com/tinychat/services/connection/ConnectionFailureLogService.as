package com.tinychat.services.connection
{
    import com.tinychat.services.*;

    public class ConnectionFailureLogService extends AbstractUrlLoaderService
    {

        public function ConnectionFailureLogService()
        {
            super("https://tinychat.com/api/disconnect");
            return;
        }// end function

        public function load(param1:String) : void
        {
            setUrlParameters({room:param1});
            makeGetRequest();
            return;
        }// end function

    }
}
