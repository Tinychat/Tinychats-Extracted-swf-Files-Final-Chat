package com.tinychat.model.parsers.fromowner.arguments
{

    public class FromOwnerCloseArguments extends Object
    {
        private var value:String;

        public function FromOwnerCloseArguments(param1:String)
        {
            this.value = param1;
            return;
        }// end function

        public function get username() : String
        {
            return this.value.substring(6);
        }// end function

    }
}
