package com.tinychat.services.social.network.facebook
{
    import com.facebook.graph.*;
    import com.tinychat.services.*;

    public class AbstractFacebookApiService extends AbstractFacebookService
    {

        public function AbstractFacebookApiService()
        {
            return;
        }// end function

        protected function loadApi(param1:String, param2 = null, param3:HttpMethod = null) : void
        {
            param3 = param3 ? (param3) : (HttpMethod.GET);
            Facebook.api(param1, resultHandler, param2, param3.toString());
            return;
        }// end function

        protected function loadUi(param1:String, param2:Object, param3:String = null) : void
        {
            Facebook.ui(param1, param2, null, param3);
            return;
        }// end function

    }
}
