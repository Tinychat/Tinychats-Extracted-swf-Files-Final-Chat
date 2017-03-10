package com.tinychat.model.parsers.privatemessage.arguments
{
    import com.tinychat.model.api.*;

    public class PrivateMessageVideoFilterArguments extends PrivateMessageArgumentsBase
    {
        private var _filterId:String;

        public function PrivateMessageVideoFilterArguments(param1:User, param2:String)
        {
            super(param1);
            this._filterId = param2;
            return;
        }// end function

        public function get filterId() : String
        {
            return this._filterId;
        }// end function

    }
}
