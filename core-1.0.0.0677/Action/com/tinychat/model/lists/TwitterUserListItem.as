package com.tinychat.model.lists
{
    import com.tinychat.model.social.network.twitter.*;
    import com.tinychat.model.utils.*;

    public class TwitterUserListItem extends SocialNetworkUserListItem
    {
        private var user:TwitterUser;

        public function TwitterUserListItem(param1:TwitterUser)
        {
            super(param1, DirectImageUrlLoader);
            this.user = param1;
            return;
        }// end function

        public function get fullName() : String
        {
            return this.user.fullName;
        }// end function

        override protected function get pictureUrl() : String
        {
            return this.user.pictureUrl;
        }// end function

    }
}
