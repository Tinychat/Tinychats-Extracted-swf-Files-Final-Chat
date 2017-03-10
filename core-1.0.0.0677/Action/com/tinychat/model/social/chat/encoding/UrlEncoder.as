package com.tinychat.model.social.chat.encoding
{

    public class UrlEncoder extends UrlEncoderBase
    {

        public function UrlEncoder()
        {
            return;
        }// end function

        override public function get splitter()
        {
            return EncodingMatchers.URL_MATCHER;
        }// end function

    }
}
