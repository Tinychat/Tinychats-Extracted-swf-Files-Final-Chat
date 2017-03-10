package com.tinychat.services.social.network.facebook.og
{
    import com.codecatalyst.promise.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.services.*;

    public class AbstractOpenGraphService extends AbstractUrlLoaderService
    {
        protected var deferred:Deferred;
        protected var facebook:FacebookLoginProxy;

        public function AbstractOpenGraphService(param1:String, param2:FacebookLoginProxy)
        {
            this.facebook = param2;
            super(param1);
            return;
        }// end function

        override protected function successHandler(param1:Object) : void
        {
            super.successHandler(param1);
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
