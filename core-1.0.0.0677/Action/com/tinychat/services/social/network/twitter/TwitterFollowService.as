package com.tinychat.services.social.network.twitter
{
    import com.tinychat.services.*;

    public class TwitterFollowService extends AbstractUrlLoaderService
    {

        public function TwitterFollowService(param1:String)
        {
            super(param1);
            return;
        }// end function

        public function send(param1:String, param2:Boolean = false, param3:String = "") : void
        {
            setUrlParameters({type:"tw", room:param1, follow:param2 ? ("1") : (""), followowner:param3});
            makePostRequest();
            return;
        }// end function

    }
}
