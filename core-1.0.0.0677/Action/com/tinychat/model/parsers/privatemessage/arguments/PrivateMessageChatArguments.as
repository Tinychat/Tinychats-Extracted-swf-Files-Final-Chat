package com.tinychat.model.parsers.privatemessage.arguments
{
    import com.tinychat.model.api.*;

    public class PrivateMessageChatArguments extends PrivateMessageArgumentsBase
    {
        private var _color:uint;
        private var _message:String;

        public function PrivateMessageChatArguments(param1:User, param2:uint, param3:String)
        {
            this._color = param2;
            this._message = param3;
            super(param1);
            return;
        }// end function

        public function get color() : uint
        {
            return this._color;
        }// end function

        public function get message() : String
        {
            return this._message;
        }// end function

    }
}
