package com.facebook.graph.data
{

    public class FacebookAuthResponse extends Object
    {
        public var uid:String;
        public var expireDate:Date;
        public var accessToken:String;
        public var signedRequest:String;

        public function FacebookAuthResponse()
        {
            return;
        }// end function

        public function fromJSON(result:Object) : void
        {
            if (result != null)
            {
                this.expireDate = new Date();
                this.expireDate.setTime(this.expireDate.time + result.expiresIn * 1000);
                if (!result.access_token)
                {
                }
                this.accessToken = result.accessToken;
                this.signedRequest = result.signedRequest;
                this.uid = result.userID;
            }
            return;
        }// end function

        public function toString() : String
        {
            return "[userId:" + this.uid + "]";
        }// end function

    }
}
