package com.tinychat.services.social.network.facebook.og
{
    import com.codecatalyst.promise.*;
    import com.tinychat.model.social.network.facebook.*;

    public class OpenGraphActionService extends AbstractOpenGraphService
    {

        public function OpenGraphActionService(param1:FacebookLoginProxy)
        {
            super("https://graph.facebook.com/" + FacebookConstants.APP_VERSION + "/me/", param1);
            return;
        }// end function

        public function send(param1:OpenGraphAction, param2:OpenGraphObject, param3:String) : Promise
        {
            var _loc_4:Object = null;
            if (!deferred)
            {
                _loc_4 = {access_token:facebook.accessToken};
                _loc_4[param2.toString()] = "https://tinychat.com/" + param3;
                deferred = new Deferred();
                setDynamicPaths(param1.toString());
                setUrlParameters(_loc_4);
                makePostRequest(_loc_4);
            }
            return deferred.promise;
        }// end function

    }
}
