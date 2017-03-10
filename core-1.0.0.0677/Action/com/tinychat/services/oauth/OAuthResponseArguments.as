package com.tinychat.services.oauth
{

    public class OAuthResponseArguments extends Object
    {
        private var _response:OAuthResponse;
        private var _provider:OAuthProvider;
        private var _id:String;
        private var _name:String;
        private var _pictureUrl:String;

        public function OAuthResponseArguments(param1:String, param2:String = "", param3:String = "", param4:String = "", param5:String = "")
        {
            this._response = OAuthResponse.fromValue(param1);
            this._provider = OAuthProvider.fromCode(param2);
            this._id = param3;
            this._name = param4;
            this._pictureUrl = param5.replace(/\\/g, "");
            return;
        }// end function

        public function get response() : OAuthResponse
        {
            return this._response;
        }// end function

        public function get provider() : OAuthProvider
        {
            return this._provider;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get pictureUrl() : String
        {
            return this._pictureUrl;
        }// end function

    }
}
