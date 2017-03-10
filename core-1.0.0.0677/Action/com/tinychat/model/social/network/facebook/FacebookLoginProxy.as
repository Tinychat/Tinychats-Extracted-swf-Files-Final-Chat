package com.tinychat.model.social.network.facebook
{
    import com.facebook.graph.*;
    import com.facebook.graph.data.*;
    import com.tinychat.model.social.network.*;
    import com.tinychat.services.social.network.facebook.*;
    import flash.events.*;
    import flash.utils.*;

    public class FacebookLoginProxy extends AbstractSocialNetworkProxy
    {
        private var loginService:FacebookLoginService;
        private var userInfoService:FacebookUserInfoService;
        private var loginSequence:FacebookLoginSequence;
        private var _session:FacebookAuthResponse;
        private var _user:MyFacebookUser;
        private var sessionPing:Timer;
        private static const SESSION_PING_TIMEOUT:uint = 60000;

        public function FacebookLoginProxy(param1:FacebookLoginService, param2:FacebookUserInfoService)
        {
            this.loginService = param1;
            this.userInfoService = param2;
            param1.success.add(this.loginSuccessHandler);
            param2.success.add(this.userInfoSuccessHandler);
            this.sessionPing = new Timer(SESSION_PING_TIMEOUT);
            this.sessionPing.addEventListener(TimerEvent.TIMER, this.sessionPingHandler);
            return;
        }// end function

        public function get uid() : String
        {
            return this.session ? (this.session.uid) : ("");
        }// end function

        public function get accessToken() : String
        {
            return this.session ? (this.session.accessToken) : ("");
        }// end function

        override public function get currentUser() : SocialNetworkUser
        {
            return this._user;
        }// end function

        public function get facebookUser() : MyFacebookUser
        {
            return this._user;
        }// end function

        override public function login(param1:Object) : void
        {
            if (!isLoggingIn)
            {
                _isLoggingIn = true;
                this.loginSequence = new FacebookLoginSequence(this.loginService, this.userInfoService);
                this.loginSequence.complete.addOnce(this.loginSequenceCompleteHandler);
                this.loginSequence.execute();
            }
            return;
        }// end function

        override public function logout() : void
        {
            this.loggedOutHandler();
            return;
        }// end function

        private function get session() : FacebookAuthResponse
        {
            if (!this._session)
            {
                this._session = Facebook.getAuthResponse();
            }
            return this._session;
        }// end function

        private function loginSequenceCompleteHandler(param1:Boolean) : void
        {
            _isLoggingIn = false;
            this.loginSequence.destroy();
            this.loginSequence = null;
            if (param1)
            {
                this.loggedInHandler();
            }
            else
            {
                this.loggedOutHandler();
                _loginFailure.dispatch("");
            }
            return;
        }// end function

        private function loggedInHandler() : void
        {
            this.sessionPing.reset();
            this.sessionPing.start();
            _isLoggedIn = true;
            _loggedIn.dispatch();
            return;
        }// end function

        private function loggedOutHandler() : void
        {
            this.sessionPing.stop();
            _isLoggedIn = false;
            _loggedOut.dispatch();
            return;
        }// end function

        private function loginSuccessHandler(param1:FacebookAuthResponse) : void
        {
            this._session = param1;
            return;
        }// end function

        private function userInfoSuccessHandler(param1:MyFacebookUser) : void
        {
            this._user = param1;
            return;
        }// end function

        private function sessionPingHandler(event:TimerEvent) : void
        {
            Facebook.getLoginStatus();
            return;
        }// end function

        private function sessionChangeHandler(param1:Object) : void
        {
            return;
        }// end function

    }
}
