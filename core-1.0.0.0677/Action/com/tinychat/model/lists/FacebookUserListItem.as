package com.tinychat.model.lists
{
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.utils.*;

    public class FacebookUserListItem extends SocialNetworkUserListItem implements FacebookUser
    {
        private var user:FacebookUser;

        public function FacebookUserListItem(param1:FacebookUser)
        {
            this.user = param1;
            super(param1, RedirectImageUrlLoader);
            return;
        }// end function

        public function get firstName() : String
        {
            return this.user.firstName;
        }// end function

        override protected function get pictureUrl() : String
        {
            return "https://graph.facebook.com/" + FacebookConstants.APP_VERSION + "/" + id + "/picture";
        }// end function

    }
}
