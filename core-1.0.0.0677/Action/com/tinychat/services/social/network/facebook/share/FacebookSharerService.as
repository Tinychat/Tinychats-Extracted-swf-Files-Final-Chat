package com.tinychat.services.social.network.facebook.share
{
    import com.tinychat.model.javascript.*;

    public class FacebookSharerService extends Object
    {
        private var javascript:ApplicationJavascript;
        private var base:String;
        protected var title:String;
        protected var url:String;
        protected var images:Array;
        protected var summary:String;

        public function FacebookSharerService(param1:ApplicationJavascript)
        {
            this.javascript = param1;
            this.base = "https://www.facebook.com/sharer/sharer.php";
            return;
        }// end function

        protected function postSharer() : void
        {
            var _loc_1:* = this.base;
            _loc_1 = _loc_1 + ("?u=" + this.url);
            this.javascript.openPopup(_loc_1);
            return;
        }// end function

    }
}
