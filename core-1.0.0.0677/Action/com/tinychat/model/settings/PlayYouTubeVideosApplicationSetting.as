package com.tinychat.model.settings
{
    import com.tinychat.model.cookie.*;

    public class PlayYouTubeVideosApplicationSetting extends AbstractFlashCookieApplicationSetting
    {

        public function PlayYouTubeVideosApplicationSetting(param1:FlashCookieProxy, param2:String)
        {
            super(param1, param2);
            return;
        }// end function

        override public function get value() : Object
        {
            return flashCookie.playYouTubeVideos;
        }// end function

        override public function set value(param1:Object) : void
        {
            if (param1 is Boolean)
            {
                flashCookie.playYouTubeVideos = param1;
            }
            return;
        }// end function

    }
}
