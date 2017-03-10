package com.tinychat.model.social.network
{
    import org.osflash.signals.*;

    public interface SocialNetworkProxy
    {

        public function SocialNetworkProxy();

        function get isLoggedIn() : Boolean;

        function get isLoggingIn() : Boolean;

        function get loggedIn() : ISignal;

        function get loggedOut() : ISignal;

        function get loginFailure() : ISignal;

        function get currentUser() : SocialNetworkUser;

        function login(param1:Object) : void;

        function logout() : void;

    }
}
