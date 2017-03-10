package com.tinychat.services.room
{
    import com.codecatalyst.promise.*;
    import com.tinychat.services.*;

    public class ChatCaptchaService extends AbstractJsonLoaderService
    {
        private var deferred:Deferred;

        public function ChatCaptchaService()
        {
            super("https://tinychat.com/api/captcha/check.php");
            return;
        }// end function

        public function load(param1:String, param2:String, param3:String) : Promise
        {
            if (!this.deferred)
            {
                this.deferred = new Deferred();
                setUrlParameters({guest_id:param1, room:param3 + "^" + param2});
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
