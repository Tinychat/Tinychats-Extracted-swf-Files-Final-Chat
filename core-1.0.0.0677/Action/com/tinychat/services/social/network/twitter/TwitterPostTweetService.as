package com.tinychat.services.social.network.twitter
{
    import com.tinychat.services.*;

    public class TwitterPostTweetService extends AbstractUrlLoaderService
    {

        public function TwitterPostTweetService(param1:String)
        {
            super(param1);
            return;
        }// end function

        public function send(param1:String, param2:String) : void
        {
            setUrlParameters({type:"tw", room:param1, message:param2});
            makePostRequest();
            return;
        }// end function

    }
}
