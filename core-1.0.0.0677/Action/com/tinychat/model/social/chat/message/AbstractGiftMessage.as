package com.tinychat.model.social.chat.message
{

    public class AbstractGiftMessage extends TimestampedMessage
    {
        private var _url:String;
        private var _comment:String;

        public function AbstractGiftMessage(param1:String, param2:uint, param3:String, param4:String)
        {
            super(param1, param2);
            this._url = param3;
            this._comment = param4;
            return;
        }// end function

        public function get url() : String
        {
            return this._url;
        }// end function

        public function get comment() : String
        {
            return this._comment;
        }// end function

    }
}
