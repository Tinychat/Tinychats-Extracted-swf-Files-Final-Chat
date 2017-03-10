package com.tinychat.services.vo
{

    public class ServiceResponse extends Object
    {
        private var value:String;
        public static const SUCCESS:ServiceResponse = new ServiceResponse(SUCCESS, "success");
        public static const FAILURE:ServiceResponse = new ServiceResponse(FAILURE, "failure");

        public function ServiceResponse(param1:ServiceResponse, param2:String)
        {
            this.value = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

    }
}
