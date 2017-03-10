package com.tinychat.services.social.network.facebook.og
{

    public class OpenGraphAction extends Object
    {
        private var value:String;
        public static const WATCH:OpenGraphAction = new OpenGraphAction(WATCH, "video.watches");

        public function OpenGraphAction(param1:OpenGraphAction, param2:String)
        {
            this.value = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

    }
}
