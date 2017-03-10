package com.tinychat.model.login
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.*;
    import com.tinychat.services.oauth.*;
    import flash.errors.*;

    public class AbstractOAuthLogin extends AbstractSocialNetworkProxy
    {
        protected var _user:SocialNetworkUserListItem;
        private var service:OAuthLoginService;
        private var provider:OAuthProvider;

        public function AbstractOAuthLogin(param1:OAuthLoginService, param2:OAuthProvider)
        {
            this.service = param1;
            this.provider = param2;
            return;
        }// end function

        override public function get currentUser() : SocialNetworkUser
        {
            return this._user;
        }// end function

        override public function login(param1:Object) : void
        {
            if (_isLoggedIn)
            {
                _loggedIn.dispatch();
            }
            else
            {
                _isLoggingIn = true;
                this.addOAuthHandlers();
                this.service.login(this.provider);
            }
            return;
        }// end function

        override public function logout() : void
        {
            _loggedOut.dispatch();
            return;
        }// end function

        protected function setCurrentUser(param1:SocialNetworkUserListItem) : void
        {
            this._user = param1;
            return;
        }// end function

        protected function loginSuccess() : void
        {
            _isLoggedIn = true;
            _loggedIn.dispatch();
            return;
        }// end function

        protected function loginFailed(param1:String) : void
        {
            _isLoggingIn = false;
            _isLoggedIn = false;
            _loginFailure.dispatch(param1);
            _loggedOut.dispatch();
            return;
        }// end function

        protected function parseCurrentUser(param1:OAuthResponseArguments) : SocialNetworkUserListItem
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        private function oAuthSuccessHandler(param1:OAuthResponseArguments) : void
        {
            this.removeOAuthHandlers();
            this.setCurrentUser(this.parseCurrentUser(param1));
            this.loginSuccess();
            return;
        }// end function

        private function oAuthFailureHandler(param1:String) : void
        {
            this.removeOAuthHandlers();
            this.loginFailed(param1);
            return;
        }// end function

        private function addOAuthHandlers() : void
        {
            this.service.success.addOnce(this.oAuthSuccessHandler);
            this.service.failure.addOnce(this.oAuthFailureHandler);
            return;
        }// end function

        private function removeOAuthHandlers() : void
        {
            this.service.success.remove(this.oAuthSuccessHandler);
            this.service.failure.remove(this.oAuthFailureHandler);
            return;
        }// end function

    }
}
