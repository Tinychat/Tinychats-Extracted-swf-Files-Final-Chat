package com.tinychat.services
{

    public class HttpMethod extends Object
    {
        private var value:String;
        public static const GET:HttpMethod = new HttpMethod(GET, "GET");
        public static const POST:HttpMethod = new HttpMethod(POST, "POST");

        public function HttpMethod(param1:HttpMethod, param2:String)
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
