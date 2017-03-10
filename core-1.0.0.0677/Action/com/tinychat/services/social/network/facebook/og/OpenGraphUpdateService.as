package com.tinychat.services.social.network.facebook.og
{
    import com.codecatalyst.promise.*;
    import com.tinychat.model.social.network.facebook.*;

    public class OpenGraphUpdateService extends AbstractOpenGraphService
    {

        public function OpenGraphUpdateService(param1:FacebookLoginProxy)
        {
            super("https://graph.facebook.com/" + FacebookConstants.APP_VERSION + "/", param1);
            return;
        }// end function

        public function send(param1:String, param2:Object) : Promise
        {
            var _loc_3:Object = null;
            var _loc_4:String = null;
            if (!deferred)
            {
                _loc_3 = {access_token:facebook.accessToken};
                for (_loc_4 in param2)
                {
                    
                    _loc_3[_loc_4] = param2[_loc_4];
                }
                deferred = new Deferred();
                setDynamicPaths(param1.toString());
                setUrlParameters(_loc_3);
                makePostRequest(_loc_3);
            }
            return deferred.promise;
        }// end function

    }
}
