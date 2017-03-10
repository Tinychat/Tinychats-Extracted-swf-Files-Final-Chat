package com.tinychat.model.social.chat.encoding
{

    public class EmailEncoder extends UrlEncoderBase
    {

        public function EmailEncoder()
        {
            return;
        }// end function

        override public function get splitter()
        {
            return EncodingMatchers.EMAIL_MATCHER;
        }// end function

    }
}
