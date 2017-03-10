package com.tinychat.services.vo
{
    import com.tinychat.model.authorization.*;

    public class BroadcastAuthenticationInfo extends Object
    {
        private var _status:BroadcastAuthorizationStatus;
        private var _token:String;

        public function BroadcastAuthenticationInfo(param1:BroadcastAuthorizationStatus, param2:String)
        {
            this._status = param1;
            this._token = param2;
            return;
        }// end function

        public function get status() : BroadcastAuthorizationStatus
        {
            return this._status;
        }// end function

        public function get token() : String
        {
            return this._token;
        }// end function

    }
}
