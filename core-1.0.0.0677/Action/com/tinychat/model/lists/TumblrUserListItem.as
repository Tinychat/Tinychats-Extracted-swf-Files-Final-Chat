package com.tinychat.model.lists
{
    import com.tinychat.model.social.network.tumblr.*;
    import com.tinychat.model.utils.*;

    public class TumblrUserListItem extends SocialNetworkUserListItem
    {
        private var user:TumblrUser;

        public function TumblrUserListItem(param1:TumblrUser)
        {
            super(param1, DirectImageUrlLoader);
            this.user = param1;
            return;
        }// end function

        override protected function get pictureUrl() : String
        {
            return this.user.pictureUrl;
        }// end function

    }
}
