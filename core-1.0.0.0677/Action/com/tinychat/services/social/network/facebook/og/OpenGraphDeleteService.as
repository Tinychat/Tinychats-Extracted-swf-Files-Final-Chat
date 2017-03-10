package com.tinychat.services.social.network.facebook.og
{
    import com.codecatalyst.promise.*;
    import com.tinychat.model.social.network.facebook.*;

    public class OpenGraphDeleteService extends AbstractOpenGraphService
    {

        public function OpenGraphDeleteService(param1:FacebookLoginProxy)
        {
            super("https://graph.facebook.com/" + FacebookConstants.APP_VERSION + "/", param1);
            return;
        }// end function

        public function send(param1:String) : Promise
        {
            var _loc_2:Object = null;
            if (!deferred)
            {
                deferred = new Deferred();
                _loc_2 = {access_token:facebook.accessToken, method:"delete"};
                deferred = new Deferred();
                setDynamicPaths(param1.toString());
                setUrlParameters(_loc_2);
                makePostRequest(_loc_2);
            }
            return deferred.promise;
        }// end function

    }
}
