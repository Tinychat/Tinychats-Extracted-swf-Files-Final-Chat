package com.tinychat.model.social.network.tumblr
{
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.presence.*;

    public class TumblrUser extends AbstractSocialNetworkUser
    {
        private var _pictureUrl:String;

        public function TumblrUser(param1:String, param2:String, param3:String)
        {
            super(param1, param2, PresenceType.OFFLINE);
            this._pictureUrl = param3;
            return;
        }// end function

        public function get pictureUrl() : String
        {
            return this._pictureUrl;
        }// end function

    }
}
