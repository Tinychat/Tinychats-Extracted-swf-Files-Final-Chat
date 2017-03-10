package com.tinychat.model.social.network
{
    import com.tinychat.model.social.network.signals.*;
    import flash.errors.*;
    import org.osflash.signals.*;

    public class AbstractSocialNetworkProxy extends Object implements SocialNetworkProxy
    {
        protected var _isLoggedIn:Boolean;
        protected var _isLoggingIn:Boolean;
        protected var _loggedIn:LoggedIn;
        protected var _loggedOut:LoggedOut;
        protected var _loginFailure:LoginFailure;

        public function AbstractSocialNetworkProxy()
        {
            this._loggedIn = new LoggedIn();
            this._loggedOut = new LoggedOut();
            this._loginFailure = new LoginFailure();
            return;
        }// end function

        public function get isLoggedIn() : Boolean
        {
            return this._isLoggedIn;
        }// end function

        public function get isLoggingIn() : Boolean
        {
            return this._isLoggingIn;
        }// end function

        public function get loggedIn() : ISignal
        {
            return this._loggedIn;
        }// end function

        public function get loggedOut() : ISignal
        {
            return this._loggedOut;
        }// end function

        public function get loginFailure() : ISignal
        {
            return this._loginFailure;
        }// end function

        public function get currentUser() : SocialNetworkUser
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        public function login(param1:Object) : void
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        public function logout() : void
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

    }
}
