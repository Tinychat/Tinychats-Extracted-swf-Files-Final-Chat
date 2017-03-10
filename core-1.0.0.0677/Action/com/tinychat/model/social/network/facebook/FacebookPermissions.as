package com.tinychat.model.social.network.facebook
{
    import com.tinychat.services.social.network.facebook.*;
    import org.osflash.signals.*;

    public class FacebookPermissions extends Object
    {
        private var service:FacebookGetPermissionsService;
        private var _actual:Array;
        private var _loaded:Signal;
        public static const XMPP_LOGIN:String = "xmpp_login";
        public static const PUBLISH_ACTIONS:String = "publish_actions";
        public static const USER_FTIENDS:String = "user_friends";
        public static const REQUIRED_FOR_APP:Array = [PUBLISH_ACTIONS];

        public function FacebookPermissions(param1:FacebookGetPermissionsService)
        {
            this.service = param1;
            this.service.success.add(this.successHandler);
            this.service.failure.add(this.failureHandler);
            this._actual = [];
            this._loaded = new Signal(Object);
            return;
        }// end function

        public function get actual() : Array
        {
            return this._actual;
        }// end function

        public function get loaded() : ISignal
        {
            return this._loaded;
        }// end function

        public function has(param1:Array) : Boolean
        {
            var _loc_2:String = null;
            for each (_loc_2 in param1)
            {
                
                if (this.actual.indexOf(_loc_2) == -1)
                {
                    return false;
                }
            }
            return true;
        }// end function

        public function load() : void
        {
            this.service.load();
            return;
        }// end function

        private function successHandler(param1:Object) : void
        {
            var _loc_2:Object = null;
            this._actual = [];
            for (_loc_2 in param1)
            {
                
                if (param1[_loc_2].status == "granted")
                {
                    this._actual.push(param1[_loc_2].permission);
                }
            }
            this.dispatchLoaded();
            return;
        }// end function

        private function failureHandler(param1:Object) : void
        {
            this._actual = [];
            this.dispatchLoaded();
            return;
        }// end function

        private function dispatchLoaded() : void
        {
            this._loaded.dispatch(this._actual);
            return;
        }// end function

    }
}
