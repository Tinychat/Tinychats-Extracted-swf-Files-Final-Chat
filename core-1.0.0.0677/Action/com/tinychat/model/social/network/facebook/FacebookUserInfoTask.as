package com.tinychat.model.social.network.facebook
{
    import com.tinychat.services.social.network.facebook.*;

    public class FacebookUserInfoTask extends FacebookServiceTask
    {

        public function FacebookUserInfoTask(param1:FacebookUserInfoService)
        {
            super(param1, param1.load);
            return;
        }// end function

    }
}
