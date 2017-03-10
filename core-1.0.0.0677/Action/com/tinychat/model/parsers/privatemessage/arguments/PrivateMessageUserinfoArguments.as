package com.tinychat.model.parsers.privatemessage.arguments
{
    import com.tinychat.model.api.*;

    public class PrivateMessageUserinfoArguments extends PrivateMessageArgumentsBase
    {
        private var _tinychatId:String;

        public function PrivateMessageUserinfoArguments(param1:User, param2:String)
        {
            this._tinychatId = param2;
            super(param1);
            return;
        }// end function

        public function get tinychatUsername() : String
        {
            return this._tinychatId;
        }// end function

    }
}
