package com.tinychat.services.oauth
{

    public class OAuthProvider extends Object
    {
        private var _code:String;
        private var _description:String;
        private static var codeToTypeLookup:Object = {};
        public static const TUMBLR:OAuthProvider = new OAuthProvider(TUMBLR, "tb", "Tumblr");
        public static const TWITTER:OAuthProvider = new OAuthProvider(TWITTER, "tw", "Twitter");

        public function OAuthProvider(param1:OAuthProvider, param2:String, param3:String)
        {
            this._code = param2;
            this._description = param3;
            codeToTypeLookup[this._code] = this;
            return;
        }// end function

        public function get code() : String
        {
            return this._code;
        }// end function

        public function get description() : String
        {
            return this._description;
        }// end function

        public static function fromCode(param1:String) : OAuthProvider
        {
            return codeToTypeLookup[param1];
        }// end function

    }
}
