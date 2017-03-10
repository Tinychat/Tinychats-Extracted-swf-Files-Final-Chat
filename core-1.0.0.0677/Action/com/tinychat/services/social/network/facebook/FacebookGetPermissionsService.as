package com.tinychat.services.social.network.facebook
{

    public class FacebookGetPermissionsService extends AbstractFacebookApiService
    {

        public function FacebookGetPermissionsService()
        {
            return;
        }// end function

        public function load() : void
        {
            loadApi("/me/permissions");
            return;
        }// end function

    }
}
