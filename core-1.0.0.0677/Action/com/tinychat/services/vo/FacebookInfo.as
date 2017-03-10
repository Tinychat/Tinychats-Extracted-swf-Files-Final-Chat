package com.tinychat.services.vo
{

    public class FacebookInfo extends Object
    {
        private var _response:ServiceResponse;
        private var _name:String;
        private var _accessToken:String;
        private var _id:String;
        private var _pictureUrl:String;
        private var _session:String;

        public function FacebookInfo(param1:ServiceResponse, param2:String, param3:String, param4:String, param5:String, param6:String)
        {
            this._response = param1;
            this._name = param2;
            this._accessToken = param3;
            this._id = param4;
            this._pictureUrl = param5;
            this._session = param6;
            return;
        }// end function

        public function get response() : ServiceResponse
        {
            return this._response;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get accessToken() : String
        {
            return this._accessToken;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get pictureUrl() : String
        {
            return this._pictureUrl;
        }// end function

        public function get session() : String
        {
            return this._session;
        }// end function

        public function toString() : String
        {
            return this._response + " " + this._name + " " + this._accessToken + " " + this._id + " " + this._pictureUrl + " " + this._session;
        }// end function

    }
}
