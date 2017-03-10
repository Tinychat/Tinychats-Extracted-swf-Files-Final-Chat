package com.tinychat.model.social.network.facebook
{
    import com.tinychat.model.social.network.presence.*;

    public class MyFacebookUser extends MutableFacebookUser
    {
        private var _link:String;

        public function MyFacebookUser(param1:String, param2:String, param3:PresenceType, param4:String)
        {
            this._link = param4;
            super(param1, param2, param3);
            return;
        }// end function

        public function get link() : String
        {
            return this._link;
        }// end function

    }
}
