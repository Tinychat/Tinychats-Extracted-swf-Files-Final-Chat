package com.tinychat.services.oauth
{

    public class OAuthResponse extends Object
    {
        private var value:String;
        private static var valueToTypeLookup:Object = {};
        public static const BLOCKED:OAuthResponse = new OAuthResponse(BLOCKED, "blocked");
        public static const CLOSED:OAuthResponse = new OAuthResponse(CLOSED, "closed");
        public static const SUCCESS:OAuthResponse = new OAuthResponse(SUCCESS, "OK");
        public static const UNKNOWN:OAuthResponse = new OAuthResponse(UNKNOWN, "unknown");

        public function OAuthResponse(param1:OAuthResponse, param2:String)
        {
            this.value = param2;
            valueToTypeLookup[param2] = this;
            return;
        }// end function

        public static function fromValue(param1:String) : OAuthResponse
        {
            if (valueToTypeLookup[param1])
            {
                return valueToTypeLookup[param1];
            }
            return OAuthResponse.UNKNOWN;
        }// end function

    }
}
