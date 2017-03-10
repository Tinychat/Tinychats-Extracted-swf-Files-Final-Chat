package com.tinychat.model.social.network.facebook
{
    import com.tinychat.services.social.network.facebook.*;

    public class FacebookLoginTask extends FacebookServiceTask
    {

        public function FacebookLoginTask(param1:FacebookLoginService)
        {
            super(param1, param1.login);
            return;
        }// end function

    }
}
