package com.tinychat.model.login
{
    import com.tinychat.model.social.network.*;
    import mx.utils.*;

    public class GuestLogin extends AbstractSocialNetworkProxy
    {
        private var _user:GuestUser;

        public function GuestLogin()
        {
            return;
        }// end function

        override public function get currentUser() : SocialNetworkUser
        {
            return this._user;
        }// end function

        override public function login(param1:Object) : void
        {
            _isLoggedIn = true;
            this._user = new GuestUser(UIDUtil.createUID(), param1.name);
            return;
        }// end function

        override public function logout() : void
        {
            _isLoggedIn = false;
            this._user = null;
            return;
        }// end function

    }
}
