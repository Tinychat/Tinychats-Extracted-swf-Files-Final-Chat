package com.tinychat.services.social.network.twitter
{
    import com.tinychat.model.api.*;
    import flash.net.*;

    public class TwitterDirectMessageService extends Object
    {
        private var url:String;
        private var urlLoader:URLLoader;

        public function TwitterDirectMessageService(param1:String)
        {
            this.url = param1;
            return;
        }// end function

        public function send(param1:String, param2:UserIdentity) : void
        {
            this.urlLoader = new URLLoader();
            var _loc_3:* = new URLVariables();
            _loc_3.to = param2.name;
            _loc_3.msg = param1;
            var _loc_4:* = new URLRequest(this.url);
            _loc_4.method = URLRequestMethod.POST;
            _loc_4.data = _loc_3;
            this.urlLoader.load(_loc_4);
            return;
        }// end function

    }
}
