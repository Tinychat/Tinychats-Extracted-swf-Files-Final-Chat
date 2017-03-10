package com.tinychat.model.validation.facebook
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.facebook.*;

    public class IsntCurrentFacebookUser extends Object implements IsntCurrentSocialNetworkUser
    {
        private var facebookLogin:FacebookLoginProxy;

        public function IsntCurrentFacebookUser(param1:FacebookLoginProxy)
        {
            this.facebookLogin = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            if (this.facebookLogin.currentUser)
            {
            }
            return this.facebookLogin.currentUser.id != param1.id;
        }// end function

    }
}
