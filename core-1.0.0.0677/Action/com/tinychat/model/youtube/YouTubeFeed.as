package com.tinychat.model.youtube
{
    import __AS3__.vec.*;

    public class YouTubeFeed extends Object
    {
        private var _title:String;
        private var _clips:Vector.<YouTubeClip>;

        public function YouTubeFeed(param1:String, param2:Vector.<YouTubeClip>)
        {
            this._title = param1;
            this._clips = param2;
            return;
        }// end function

        public function get title() : String
        {
            return this._title;
        }// end function

        public function get clips() : Vector.<YouTubeClip>
        {
            return this._clips;
        }// end function

        public function toString() : String
        {
            return [this.title].toString();
        }// end function

    }
}
