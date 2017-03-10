package com.facebook.graph
{
    import com.adobe.serialization.json.*;
    import com.facebook.graph.core.*;
    import com.facebook.graph.data.*;
    import com.facebook.graph.net.*;
    import com.facebook.graph.utils.*;
    import flash.external.*;
    import flash.net.*;
    import flash.utils.*;

    public class Facebook extends AbstractFacebook
    {
        protected var jsCallbacks:Object;
        protected var openUICalls:Dictionary;
        protected var jsBridge:FacebookJSBridge;
        protected var applicationId:String;
        protected var _initCallback:Function;
        protected var _loginCallback:Function;
        protected var _logoutCallback:Function;
        static var _instance:Facebook;
        static var _canInit:Boolean = false;

        public function Facebook()
        {
            if (_canInit == false)
            {
                throw new Error("Facebook is an singleton and cannot be instantiated.");
            }
            this.jsBridge = new FacebookJSBridge();
            this.jsCallbacks = {};
            this.openUICalls = new Dictionary();
            return;
        }// end function

        protected function init(applicationId:String, callback:Function = null, options:Object = null, accessToken:String = null) : void
        {
            ExternalInterface.addCallback("handleJsEvent", this.handleJSEvent);
            ExternalInterface.addCallback("authResponseChange", this.handleAuthResponseChange);
            ExternalInterface.addCallback("logout", this.handleLogout);
            ExternalInterface.addCallback("uiResponse", this.handleUI);
            this._initCallback = callback;
            this.applicationId = applicationId;
            this.oauth2 = true;
            if (options == null)
            {
                options = {};
            }
            options.appId = applicationId;
            options.oauth = true;
            ExternalInterface.call("FBAS.init", JSON.encode(options));
            if (accessToken != null)
            {
                authResponse = new FacebookAuthResponse();
                authResponse.accessToken = accessToken;
            }
            if (options.status !== false)
            {
                this.getLoginStatus();
            }
            else if (this._initCallback != null)
            {
                this._initCallback(authResponse, null);
                this._initCallback = null;
            }
            return;
        }// end function

        protected function getLoginStatus() : void
        {
            ExternalInterface.call("FBAS.getLoginStatus");
            return;
        }// end function

        protected function callJS(methodName:String, params:Object) : void
        {
            ExternalInterface.call(methodName, params);
            return;
        }// end function

        protected function setCanvasSize(width:Number, height:Number) : void
        {
            ExternalInterface.call("FBAS.setCanvasSize", width, height);
            return;
        }// end function

        protected function setCanvasAutoResize(autoSize:Boolean = true, interval:uint = 100) : void
        {
            ExternalInterface.call("FBAS.setCanvasAutoResize", autoSize, interval);
            return;
        }// end function

        protected function login(callback:Function, options:Object = null) : void
        {
            this._loginCallback = callback;
            ExternalInterface.call("FBAS.login", JSON.encode(options));
            return;
        }// end function

        protected function logout(callback:Function) : void
        {
            this._logoutCallback = callback;
            ExternalInterface.call("FBAS.logout");
            return;
        }// end function

        protected function getAuthResponse() : FacebookAuthResponse
        {
            var authResponseObj:Object;
            var result:* = ExternalInterface.call("FBAS.getAuthResponse");
            try
            {
                authResponseObj = JSON.decode(result);
            }
            catch (e)
            {
                return null;
            }
            var a:* = new FacebookAuthResponse();
            a.fromJSON(authResponseObj);
            this.authResponse = a;
            return authResponse;
        }// end function

        protected function ui(method:String, data:Object, callback:Function = null, display:String = null) : void
        {
            data.method = method;
            if (callback != null)
            {
                this.openUICalls[method] = callback;
            }
            if (display)
            {
                data.display = display;
            }
            ExternalInterface.call("FBAS.ui", JSON.encode(data));
            return;
        }// end function

        protected function addJSEventListener(event:String, listener:Function) : void
        {
            if (this.jsCallbacks[event] == null)
            {
                this.jsCallbacks[event] = new Dictionary();
                ExternalInterface.call("FBAS.addEventListener", event);
            }
            this.jsCallbacks[event][listener] = null;
            return;
        }// end function

        protected function removeJSEventListener(event:String, listener:Function) : void
        {
            if (this.jsCallbacks[event] == null)
            {
                return;
            }
            delete this.jsCallbacks[event][listener];
            return;
        }// end function

        protected function hasJSEventListener(event:String, listener:Function) : Boolean
        {
            if (this.jsCallbacks[event] != null)
            {
            }
            if (this.jsCallbacks[event][listener] !== null)
            {
                return false;
            }
            return true;
        }// end function

        protected function handleUI(result:String, method:String) : void
        {
            var _loc_3:* = result ? (JSON.decode(result)) : (null);
            var _loc_4:* = this.openUICalls[method];
            if (_loc_4 === null)
            {
                delete this.openUICalls[method];
            }
            else
            {
                this._loc_4(_loc_3);
                delete this.openUICalls[method];
            }
            return;
        }// end function

        protected function handleLogout() : void
        {
            authResponse = null;
            if (this._logoutCallback != null)
            {
                this._logoutCallback(true);
                this._logoutCallback = null;
            }
            return;
        }// end function

        protected function handleJSEvent(event:String, result:String = null) : void
        {
            var decodedResult:Object;
            var func:Object;
            var event:* = event;
            var result:* = result;
            if (this.jsCallbacks[event] != null)
            {
                try
                {
                    decodedResult = JSON.decode(result);
                }
                catch (e:JSONParseError)
                {
                }
                var _loc_4:int = 0;
                var _loc_5:* = this.jsCallbacks[event];
                while (_loc_5 in _loc_4)
                {
                    
                    func = _loc_5[_loc_4];
                    this.func as Function(decodedResult);
                    delete this.jsCallbacks[event][func];
                }
            }
            return;
        }// end function

        protected function handleAuthResponseChange(result:String) : void
        {
            var resultObj:Object;
            var result:* = result;
            var success:Boolean;
            if (result != null)
            {
                try
                {
                    resultObj = JSON.decode(result);
                }
                catch (e:JSONParseError)
                {
                    success;
                }
            }
            else
            {
                success;
            }
            if (success)
            {
                if (authResponse == null)
                {
                    authResponse = new FacebookAuthResponse();
                    authResponse.fromJSON(resultObj);
                }
                else
                {
                    authResponse.fromJSON(resultObj);
                }
            }
            if (this._initCallback != null)
            {
                this._initCallback(authResponse, null);
                this._initCallback = null;
            }
            if (this._loginCallback != null)
            {
                this._loginCallback(authResponse, null);
                this._loginCallback = null;
            }
            return;
        }// end function

        public static function init(applicationId:String, callback:Function = null, options:Object = null, accessToken:String = null) : void
        {
            getInstance().init(applicationId, callback, options, accessToken);
            return;
        }// end function

        public static function set locale(value:String) : void
        {
            getInstance().locale = value;
            return;
        }// end function

        public static function login(callback:Function, options:Object = null) : void
        {
            getInstance().login(callback, options);
            return;
        }// end function

        public static function mobileLogin(redirectUri:String, display:String = "touch", extendedPermissions:Array = null) : void
        {
            var _loc_4:* = new URLVariables();
            _loc_4.client_id = getInstance().applicationId;
            _loc_4.redirect_uri = redirectUri;
            _loc_4.display = display;
            if (extendedPermissions != null)
            {
                _loc_4.scope = extendedPermissions.join(",");
            }
            var _loc_5:* = new URLRequest(FacebookURLDefaults.AUTH_URL);
            _loc_5.method = URLRequestMethod.GET;
            _loc_5.data = _loc_4;
            navigateToURL(_loc_5, "_self");
            return;
        }// end function

        public static function mobileLogout(redirectUri:String) : void
        {
            getInstance().authResponse = null;
            var _loc_2:* = new URLVariables();
            _loc_2.confirm = 1;
            _loc_2.next = redirectUri;
            var _loc_3:* = new URLRequest("http://m.facebook.com/logout.php");
            _loc_3.method = URLRequestMethod.GET;
            _loc_3.data = _loc_2;
            navigateToURL(_loc_3, "_self");
            return;
        }// end function

        public static function logout(callback:Function) : void
        {
            getInstance().logout(callback);
            return;
        }// end function

        public static function ui(method:String, data:Object, callback:Function = null, display:String = null) : void
        {
            getInstance().ui(method, data, callback, display);
            return;
        }// end function

        public static function api(method:String, callback:Function = null, params = null, requestMethod:String = "GET") : void
        {
            getInstance().api(method, callback, params, requestMethod);
            return;
        }// end function

        public static function getRawResult(data:Object) : Object
        {
            return getInstance().getRawResult(data);
        }// end function

        public static function hasNext(data:Object) : Boolean
        {
            var _loc_2:* = getInstance().getRawResult(data);
            if (!_loc_2.paging)
            {
                return false;
            }
            return _loc_2.paging.next != null;
        }// end function

        public static function hasPrevious(data:Object) : Boolean
        {
            var _loc_2:* = getInstance().getRawResult(data);
            if (!_loc_2.paging)
            {
                return false;
            }
            return _loc_2.paging.previous != null;
        }// end function

        public static function nextPage(data:Object, callback:Function) : FacebookRequest
        {
            return getInstance().nextPage(data, callback);
        }// end function

        public static function previousPage(data:Object, callback:Function) : FacebookRequest
        {
            return getInstance().previousPage(data, callback);
        }// end function

        public static function postData(method:String, callback:Function = null, params:Object = null) : void
        {
            api(method, callback, params, URLRequestMethod.POST);
            return;
        }// end function

        public static function uploadVideo(method:String, callback:Function = null, params = null) : void
        {
            getInstance().uploadVideo(method, callback, params);
            return;
        }// end function

        public static function fqlQuery(query:String, callback:Function = null, values:Object = null) : void
        {
            getInstance().fqlQuery(query, callback, values);
            return;
        }// end function

        public static function fqlMultiQuery(queries:FQLMultiQuery, callback:Function = null, parser:IResultParser = null) : void
        {
            getInstance().fqlMultiQuery(queries, callback, parser);
            return;
        }// end function

        public static function batchRequest(batch:Batch, callback:Function = null) : void
        {
            getInstance().batchRequest(batch, callback);
            return;
        }// end function

        public static function callRestAPI(methodName:String, callback:Function, values = null, requestMethod:String = "GET") : void
        {
            getInstance().callRestAPI(methodName, callback, values, requestMethod);
            return;
        }// end function

        public static function getImageUrl(id:String, type:String = null) : String
        {
            return getInstance().getImageUrl(id, type);
        }// end function

        public static function deleteObject(method:String, callback:Function = null) : void
        {
            getInstance().deleteObject(method, callback);
            return;
        }// end function

        public static function addJSEventListener(event:String, listener:Function) : void
        {
            getInstance().addJSEventListener(event, listener);
            return;
        }// end function

        public static function removeJSEventListener(event:String, listener:Function) : void
        {
            getInstance().removeJSEventListener(event, listener);
            return;
        }// end function

        public static function hasJSEventListener(event:String, listener:Function) : Boolean
        {
            return getInstance().hasJSEventListener(event, listener);
        }// end function

        public static function setCanvasAutoResize(autoSize:Boolean = true, interval:uint = 100) : void
        {
            getInstance().setCanvasAutoResize(autoSize, interval);
            return;
        }// end function

        public static function setCanvasSize(width:Number, height:Number) : void
        {
            getInstance().setCanvasSize(width, height);
            return;
        }// end function

        public static function callJS(methodName:String, params:Object) : void
        {
            getInstance().callJS(methodName, params);
            return;
        }// end function

        public static function getAuthResponse() : FacebookAuthResponse
        {
            return getInstance().getAuthResponse();
        }// end function

        public static function getLoginStatus() : void
        {
            getInstance().getLoginStatus();
            return;
        }// end function

        static function getInstance() : Facebook
        {
            if (_instance == null)
            {
                _canInit = true;
                _instance = new Facebook;
                _canInit = false;
            }
            return _instance;
        }// end function

    }
}
