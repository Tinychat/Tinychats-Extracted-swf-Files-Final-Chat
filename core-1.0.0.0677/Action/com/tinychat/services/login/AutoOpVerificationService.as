package com.tinychat.services.login
{
    import com.tinychat.services.*;
    import org.osflash.signals.*;

    public class AutoOpVerificationService extends AbstractUrlLoaderService
    {
        private var _success:Signal;

        public function AutoOpVerificationService()
        {
            super("https://tinychat.com/api/setwallpaper.php");
            this._success = new Signal();
            return;
        }// end function

        public function send(param1:String) : void
        {
            setUrlParameters({room:param1});
            makeGetRequest();
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        override protected function successHandler(param1:Object) : void
        {
            if (param1.toString() == "1")
            {
                this._success.dispatch();
            }
            else
            {
                dispatchFailure("");
            }
            return;
        }// end function

    }
}
