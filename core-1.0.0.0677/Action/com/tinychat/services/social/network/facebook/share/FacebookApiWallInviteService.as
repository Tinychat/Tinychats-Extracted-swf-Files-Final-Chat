package com.tinychat.services.social.network.facebook.share
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.invite.facebook.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.services.*;
    import com.tinychat.services.social.network.facebook.*;

    public class FacebookApiWallInviteService extends AbstractFacebookApiService
    {
        private var templates:FacebookGeneralInviteTemplates;
        private var facebookLogin:FacebookLoginProxy;

        public function FacebookApiWallInviteService(param1:FacebookGeneralInviteTemplates, param2:FacebookLoginProxy)
        {
            this.templates = param1;
            this.facebookLogin = param2;
            return;
        }// end function

        public function send(param1:String, param2:UserIdentity) : void
        {
            this.templates.generate();
            var _loc_3:Object = {link:this.templates.roomUrl, picture:this.templates.pictureUrl, name:this.facebookLogin.facebookUser.firstName + " invited you to a group video chat.", caption:this.templates.roomUrl, description:"Click to watch or join."};
            loadApi("/" + param2.id + "/feed", _loc_3, HttpMethod.POST);
            return;
        }// end function

    }
}
