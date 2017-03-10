package com.tinychat.services.social.network.facebook
{
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.presence.*;

    public class FacebookUserInfoService extends AbstractFacebookApiService
    {

        public function FacebookUserInfoService()
        {
            return;
        }// end function

        public function load() : void
        {
            loadApi("/me");
            return;
        }// end function

        override protected function parseSuccess(param1:Object) : Object
        {
            return new MyFacebookUser(param1.id, param1.name, PresenceType.ONLINE, param1.link);
        }// end function

    }
}
