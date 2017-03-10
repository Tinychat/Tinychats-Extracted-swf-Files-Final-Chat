package com.tinychat.model.social.network.facebook
{
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.presence.*;

    public class MutableFacebookUser extends AbstractSocialNetworkUser implements FacebookUser
    {

        public function MutableFacebookUser(param1:String, param2:String, param3:PresenceType)
        {
            super(param1, param2, param3);
            return;
        }// end function

        public function get firstName() : String
        {
            return name.substring(0, name.indexOf(" "));
        }// end function

    }
}
