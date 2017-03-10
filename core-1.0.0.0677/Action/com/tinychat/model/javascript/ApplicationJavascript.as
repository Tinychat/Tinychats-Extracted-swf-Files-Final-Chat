package com.tinychat.model.javascript
{
    import com.adobe.net.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.services.oauth.*;
    import flash.external.*;
    import org.osflash.signals.*;

    public class ApplicationJavascript extends AbstractJavascriptProxy
    {
        private var _facebookLibraryLoaded:Signal;
        private var _securityPanelClosed:Signal;
        private var _securityPanelAuthorizationChanged:Signal;
        private var _oAuthResponse:Signal;
        private var _setChatHash:Signal;
        private var _setRoomHash:Signal;
        private var _soundcloudLoaded:Signal;

        public function ApplicationJavascript(param1:FlashvarsProxy, param2:String = "this")
        {
            super(param1, param2);
            return;
        }// end function

        public function get setRoomHash() : ISignal
        {
            if (!this._setRoomHash)
            {
                this._setRoomHash = new Signal();
                registerCallback("setRoomHash", dispatchSignal(this._setRoomHash));
            }
            return this._setRoomHash;
        }// end function

        public function get setChatHash() : ISignal
        {
            if (!this._setChatHash)
            {
                this._setChatHash = new Signal(String);
                registerCallback("setChatHash", dispatchSignal(this._setChatHash));
            }
            return this._setChatHash;
        }// end function

        public function showCaptcha(param1:String, param2:String, param3:String) : void
        {
            callApi("showCaptcha", param2 + "^" + param1, param3);
            return;
        }// end function

        public function get registerTracksSoundCloud() : ISignal
        {
            if (!this._soundcloudLoaded)
            {
                this._soundcloudLoaded = new Signal(Object);
                registerCallback("soundcloud_loaded", dispatchSignal(this._soundcloudLoaded));
            }
            return this._soundcloudLoaded;
        }// end function

        public function getTracksSoundCloud(param1:Object) : void
        {
            callApi("tracksLoadedSoundCloud", param1);
            return;
        }// end function

        public function get facebookLibraryLoaded() : ISignal
        {
            if (!this._facebookLibraryLoaded)
            {
                this._facebookLibraryLoaded = new Signal();
                registerCallback("facebook_loaded", dispatchSignal(this._facebookLibraryLoaded));
            }
            return this._facebookLibraryLoaded;
        }// end function

        public function loadFacebookLibrary() : void
        {
            callApi("load_facebook_js");
            return;
        }// end function

        public function get securityPanelClosed() : ISignal
        {
            if (!this._securityPanelClosed)
            {
                this._securityPanelClosed = new Signal();
                registerCallback("securityPanelClosed", dispatchSignal(this._securityPanelClosed));
            }
            return this._securityPanelClosed;
        }// end function

        public function get securityPanelAuthorizationChanged() : ISignal
        {
            if (!this._securityPanelAuthorizationChanged)
            {
                this._securityPanelAuthorizationChanged = new Signal();
                registerCallback("securityPanelAuthorizationChanged", dispatchSignal(this._securityPanelAuthorizationChanged));
            }
            return this._securityPanelAuthorizationChanged;
        }// end function

        public function openSecurityPanel(param1:String) : void
        {
            callApi("openSecurityPanel", param1);
            return;
        }// end function

        public function closeSecurityPanel() : void
        {
            callApi("closeSecurityPanel");
            return;
        }// end function

        public function get securityPanelIsAuthorized() : Boolean
        {
            return callApi("securityPanelIsAuthorized");
        }// end function

        public function get oAuthResponse() : ISignal
        {
            if (!this._oAuthResponse)
            {
                this._oAuthResponse = new Signal(OAuthResponseArguments);
                registerCallback("oAuthResponse", dispatchSignal(this._oAuthResponse, OAuthResponseArguments));
            }
            return this._oAuthResponse;
        }// end function

        public function clientOAuth(param1:String, param2:String, param3:String, param4:String) : void
        {
            callApi("clientOAuth", param1, param2, param3, param4);
            return;
        }// end function

        public function get publicChatUnreadMessageCount() : uint
        {
            return callApi("getPublicChatUnreadMessageCount");
        }// end function

        public function increasePublicChatUnreadMessageCount() : void
        {
            callApi("increasePublicChatUnreadMessageCount");
            return;
        }// end function

        public function publicChatListFocusChange(param1:Boolean) : void
        {
            callApi("publicChatListFocusChange", param1);
            return;
        }// end function

        public function privateChatListFocusChange(param1:Boolean) : void
        {
            callApi("privateChatListFocusChange", param1);
            return;
        }// end function

        public function privateMessageReceived(param1:UserIdentity) : void
        {
            callApi("privateMessageReceived", param1.name);
            return;
        }// end function

        public function liveViewers(param1:uint) : void
        {
            ExternalInterface.call("liveViewers", param1);
            return;
        }// end function

        public function applicationLoaded() : void
        {
            callApi("applicationLoaded");
            return;
        }// end function

        public function reloadApplication() : void
        {
            callApi("reloadFlash");
            return;
        }// end function

        public function get pageDomain() : String
        {
            var _loc_1:* = new URI(ExternalInterface.call("window.top.location.href.toString"));
            return _loc_1.authority;
        }// end function

        public function openPopup(param1:String, param2:String = "", param3:String = "") : void
        {
            callApi("openPopupFromSwf", param1, param2, param3);
            return;
        }// end function

        public function createFloatingDiv(param1:String) : void
        {
            callApi("createFloatingDiv", param1);
            return;
        }// end function

        public function toggleElementVisibility(param1:String, param2:Boolean) : void
        {
            callApi("toggleElementVisibility", param1, param2);
            return;
        }// end function

        public function openCaptchPanel(param1:String) : void
        {
            callApi("openCaptchPanel", param1);
            return;
        }// end function

        public function openProfileInfo(param1:String) : void
        {
            callApi("openProfileInfo", param1);
            return;
        }// end function

        public function followMember(param1:String) : String
        {
            return callApi("followMember", param1);
        }// end function

    }
}
