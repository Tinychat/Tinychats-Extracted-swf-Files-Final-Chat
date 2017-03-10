package com.tinychat.model.social.network.facebook
{
    import com.tinychat.services.social.network.facebook.*;

    public class FacebookFriendsInfoTask extends FacebookServiceTask
    {

        public function FacebookFriendsInfoTask(param1:FacebookFriendsInfoService)
        {
            super(param1, param1.load);
            return;
        }// end function

    }
}
