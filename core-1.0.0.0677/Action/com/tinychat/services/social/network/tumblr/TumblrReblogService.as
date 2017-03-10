package com.tinychat.services.social.network.tumblr
{
    import com.tinychat.services.*;

    public class TumblrReblogService extends AbstractUrlLoaderService
    {
        private static const IMAGE_URL:String = "https://tinychat.com/images/fbog/fb.php";

        public function TumblrReblogService(param1:String)
        {
            super(param1);
            return;
        }// end function

        public function send(param1:String, param2:String, param3:String) : void
        {
            var _loc_4:* = [IMAGE_URL, "?time=", Math.random()].join("");
            setUrlParameters({type:"tb", room:param1, curl:param2, message:param3, img:_loc_4});
            makePostRequest();
            return;
        }// end function

    }
}
