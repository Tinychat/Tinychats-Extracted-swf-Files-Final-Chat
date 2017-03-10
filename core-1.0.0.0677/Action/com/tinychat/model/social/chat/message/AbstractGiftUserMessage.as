package com.tinychat.model.social.chat.message
{
    import com.tinychat.model.api.*;

    public class AbstractGiftUserMessage extends AbstractUserMessage
    {
        private var _url:String;
        private var _comment:String;

        public function AbstractGiftUserMessage(param1:RenameableUser, param2:String, param3:uint, param4:String, param5:String)
        {
            super(param1, param2, param3);
            this._url = param4;
            this._comment = param5;
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
