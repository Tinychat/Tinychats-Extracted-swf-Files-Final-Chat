package com.tinychat.model.parsers.privatemessage.arguments
{
    import com.tinychat.model.api.*;

    public class PrivateMessageAllowBroadcastArguments extends PrivateMessageArgumentsBase
    {
        private var _broadcastPassword:String;

        public function PrivateMessageAllowBroadcastArguments(param1:User, param2:String)
        {
            this._broadcastPassword = param2;
            super(param1);
            return;
        }// end function

        public function get broadcastPassword() : String
        {
            return this._broadcastPassword;
        }// end function

    }
}
