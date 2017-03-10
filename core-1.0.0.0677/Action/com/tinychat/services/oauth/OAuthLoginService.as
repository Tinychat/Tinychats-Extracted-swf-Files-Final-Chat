package com.tinychat.services.oauth
{
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.signals.*;
    import org.osflash.signals.*;

    public class OAuthLoginService extends Object implements AsyncService
    {
        private var javascriptProxy:ApplicationJavascript;
        private var settings:RoomSettings;
        private var users:RoomUsers;
        private var oAuthResponse:OAuthResponse;
        private var provider:OAuthProvider;
        private var _success:Signal;
        private var _failure:Failed;

        public function OAuthLoginService(param1:ApplicationJavascript, param2:RoomSettings, param3:RoomUsers)
        {
            this.javascriptProxy = param1;
            this.settings = param2;
            this.users = param3;
            this._success = new Signal(OAuthResponseArguments);
            this._failure = new Failed();
            return;
        }// end function

        public function get success() : ISignal
        {
            return this._success;
        }// end function

        public function get failure() : ISignal
        {
            return this._failure;
        }// end function

        public function login(param1:OAuthProvider) : void
        {
            this.provider = param1;
            this.javascriptProxy.oAuthResponse.addOnce(this.oAuthCompleteHandler);
            this.javascriptProxy.clientOAuth(this.settings.namespace, param1.code, this.settings.name, this.users.currentUser ? (this.users.currentUser.id) : (""));
            return;
        }// end function

        private function oAuthCompleteHandler(param1:OAuthResponseArguments) : void
        {
            var _loc_2:String = null;
            if (param1.response == OAuthResponse.SUCCESS)
            {
            }
            if (param1.name != "")
            {
                this._success.dispatch(param1);
            }
            else
            {
                if (param1.response == OAuthResponse.BLOCKED)
                {
                    _loc_2 = "Login popup was blocked. Please deactivate popup blocker.";
                }
                else
                {
                    _loc_2 = "Unable to connect to " + this.provider.description + "...";
                }
                this._failure.dispatch(_loc_2);
            }
            return;
        }// end function

    }
}
