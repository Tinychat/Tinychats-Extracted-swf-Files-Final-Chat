package com.tinychat.services.room
{
    import com.codecatalyst.promise.*;
    import com.tinychat.services.*;

    public class RoomCaptchaService extends AbstractJsonLoaderService
    {
        private var deferred:Deferred;

        public function RoomCaptchaService()
        {
            super("https://tinychat.com/cauth/captcha");
            return;
        }// end function

        public function load() : Promise
        {
            if (!this.deferred)
            {
                this.deferred = new Deferred();
                makeGetRequest();
            }
            return this.deferred.promise;
        }// end function

        override protected function parse(param1:Object)
        {
            return param1;
        }// end function

        override protected function finish(param1) : void
        {
            this.deferred.resolve(param1);
            this.deferred = null;
            return;
        }// end function

        override protected function failureHandler(param1:String) : void
        {
            super.failureHandler(param1);
            this.deferred.reject(param1);
            this.deferred = null;
            return;
        }// end function

    }
}
