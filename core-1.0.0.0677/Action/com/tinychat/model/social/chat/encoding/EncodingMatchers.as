package com.tinychat.model.social.chat.encoding
{

    public class EncodingMatchers extends Object
    {
        private static const smileyPattern:String = "[:;8]{1}-?[\\)\\(\\/|DOoPpXS]{1}";
        public static const SMILEY_MATCHER:RegExp = new RegExp("( ^" + smileyPattern + "(?=\\.?\\s) | " + "(?<=[\\.\\s])" + smileyPattern + "(?=\\.?\\s) | " + "(?<=[\\.\\s])" + smileyPattern + "$ )", "x");
        public static const URL_MATCHER:RegExp = /((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s<>]+)+(?:[^\s`!(\[\]{};:'".,<>?«»“”‘’]))/ix;
        public static const EMAIL_MATCHER:RegExp = /(\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b)/i;
        public static const EMPHASIZED_MATCHER:RegExp = /(\*[^\s][^\n\r\*]+[^\s]\*)/x;

        public function EncodingMatchers()
        {
            return;
        }// end function

    }
}
