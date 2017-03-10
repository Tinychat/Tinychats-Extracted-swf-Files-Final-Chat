package com.tinychat.services.social.network.facebook
{
    import com.facebook.graph.*;
    import com.facebook.graph.data.*;
    import com.tinychat.model.social.network.facebook.*;

    public class FacebookLoginService extends AbstractFacebookService
    {
        private var permissions:FacebookPermissions;

        public function FacebookLoginService(param1:FacebookPermissions)
        {
            this.permissions = param1;
            return;
        }// end function

        public function login() : void
        {
            var _loc_1:* = Facebook.getAuthResponse();
            if (_loc_1)
            {
            }
            if (_loc_1.accessToken)
            {
            }
            if (this.permissions.has(FacebookPermissions.REQUIRED_FOR_APP))
            {
                super.resultHandler(_loc_1, null);
            }
            else
            {
                Facebook.login(this.resultHandler, {scope:FacebookPermissions.REQUIRED_FOR_APP.join(), return_scopes:true, auth_type:"rerequest"});
            }
            return;
        }// end function

        override protected function resultHandler(param1:Object, param2:Object) : void
        {
            var _loc_3:* = param1 as FacebookAuthResponse;
            if (_loc_3)
            {
            }
            if (_loc_3.accessToken)
            {
                super.resultHandler(_loc_3, null);
            }
            else
            {
                super.resultHandler(null, null);
            }
            return;
        }// end function

    }
}
