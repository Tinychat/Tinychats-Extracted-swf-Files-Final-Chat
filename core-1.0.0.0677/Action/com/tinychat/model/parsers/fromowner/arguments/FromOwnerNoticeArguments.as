package com.tinychat.model.parsers.fromowner.arguments
{

    public class FromOwnerNoticeArguments extends Object
    {
        private var value:String;

        public function FromOwnerNoticeArguments(param1:String)
        {
            this.value = param1;
            return;
        }// end function

        public function get message() : String
        {
            return decodeURI(this.value.substring(6));
        }// end function

    }
}
