package com.tinychat.model.parsers.privatemessage.arguments
{
    import com.tinychat.model.api.*;

    public class PrivateMessageArgumentsBase extends Object
    {
        private var _sender:User;

        public function PrivateMessageArgumentsBase(param1:User)
        {
            this._sender = param1;
            return;
        }// end function

        public function get sender() : User
        {
            return this._sender;
        }// end function

    }
}
