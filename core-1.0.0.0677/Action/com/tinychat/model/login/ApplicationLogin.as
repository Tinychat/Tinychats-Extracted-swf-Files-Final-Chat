package com.tinychat.model.login
{
    import com.tinychat.model.social.network.*;
    import flash.utils.*;

    public class ApplicationLogin extends Object
    {
        private var _current:LoginType;
        private var loginProxies:Dictionary;

        public function ApplicationLogin()
        {
            this._current = LoginType.NOT_LOGGED_IN;
            this.loginProxies = new Dictionary();
            return;
        }// end function

        public function get current() : LoginType
        {
            return this._current;
        }// end function

        public function register(param1:LoginType, param2:SocialNetworkProxy) : void
        {
            if (!this.loginProxies[param1])
            {
                this.loginProxies[param1] = param2;
            }
            param2.loggedIn.add(this.loginHandler);
            param2.loggedOut.add(this.logoutHandler);
            return;
        }// end function

        private function loginHandler() : void
        {
            return;
        }// end function

        private function logoutHandler() : void
        {
            return;
        }// end function

    }
}
