package com.tinychat.services.social.network.facebook.og
{

    public class OpenGraphObject extends Object
    {
        private var value:String;
        public static const OBJECT:OpenGraphObject = new OpenGraphObject(OBJECT, "object");
        public static const ROOM:OpenGraphObject = new OpenGraphObject(ROOM, "room");
        public static const VIDEO:OpenGraphObject = new OpenGraphObject(VIDEO, "video");

        public function OpenGraphObject(param1:OpenGraphObject, param2:String)
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
