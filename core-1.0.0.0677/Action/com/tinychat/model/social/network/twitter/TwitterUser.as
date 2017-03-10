package com.tinychat.model.social.network.twitter
{
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.presence.*;

    public class TwitterUser extends AbstractSocialNetworkUser
    {
        private var _fullName:String;
        private var _pictureUrl:String;

        public function TwitterUser(param1:String, param2:String, param3:String, param4:String)
        {
            super(param1, param2, PresenceType.OFFLINE);
            this._fullName = param3;
            this._pictureUrl = param4;
            return;
        }// end function

        public function get fullName() : String
        {
            return this._fullName;
        }// end function

        public function get pictureUrl() : String
        {
            return this._pictureUrl;
        }// end function

    }
}
