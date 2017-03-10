package com.tinychat.vendors.youtube
{

    public class YouTubePlayerState extends Object
    {
        private var _code:String;
        private var _value:String;
        private static var codeLookup:Object = {};
        public static const UNSTARTED:YouTubePlayerState = new YouTubePlayerState(UNSTARTED, "-1", "unstarted");
        public static const ENDED:YouTubePlayerState = new YouTubePlayerState(ENDED, "0", "ended");
        public static const PLAYING:YouTubePlayerState = new YouTubePlayerState(PLAYING, "1", "playing");
        public static const PAUSED:YouTubePlayerState = new YouTubePlayerState(PAUSED, "2", "paused");
        public static const BUFFERING:YouTubePlayerState = new YouTubePlayerState(BUFFERING, "3", "buffering");
        public static const VIDEO_CUED:YouTubePlayerState = new YouTubePlayerState(VIDEO_CUED, "5", "video_cued");

        public function YouTubePlayerState(param1:YouTubePlayerState, param2:String, param3:String)
        {
            this._code = param2;
            this._value = param3;
            codeLookup[param2] = this;
            return;
        }// end function

        public function get code() : String
        {
            return this._code;
        }// end function

        public function toString() : String
        {
            return this._value;
        }// end function

        public static function fromCode(param1:String) : YouTubePlayerState
        {
            return codeLookup[param1];
        }// end function

    }
}
