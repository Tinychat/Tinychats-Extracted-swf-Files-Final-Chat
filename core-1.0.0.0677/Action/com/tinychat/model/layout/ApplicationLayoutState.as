package com.tinychat.model.layout
{

    public class ApplicationLayoutState extends Object
    {
        private var _name:String;
        public static const CHAT_BELOW:ApplicationLayoutState = new ApplicationLayoutState(CHAT_BELOW, "chatBelow");
        public static const CHAT_RIGHT:ApplicationLayoutState = new ApplicationLayoutState(CHAT_RIGHT, "chatRight");
        public static const VIDEO_ONLY:ApplicationLayoutState = new ApplicationLayoutState(VIDEO_ONLY, "videoOnly");
        public static const UNDEFINED:ApplicationLayoutState = new ApplicationLayoutState(UNDEFINED, "undefined");

        public function ApplicationLayoutState(param1:ApplicationLayoutState, param2:String)
        {
            this._name = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this._name;
        }// end function

    }
}
