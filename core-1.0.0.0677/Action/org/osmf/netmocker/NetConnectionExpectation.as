package org.osmf.netmocker
{

    public class NetConnectionExpectation extends Object
    {
        private var name:String;
        public static const VALID_CONNECTION:NetConnectionExpectation = new NetConnectionExpectation("validConnection");
        public static const CONNECT_WITH_PARAMS:NetConnectionExpectation = new NetConnectionExpectation("connectWithParams");
        public static const INVALID_FMS_SERVER:NetConnectionExpectation = new NetConnectionExpectation("invalidFMSServer");
        public static const REJECTED_CONNECTION:NetConnectionExpectation = new NetConnectionExpectation("rejectedConnection");
        public static const INVALID_FMS_APPLICATION:NetConnectionExpectation = new NetConnectionExpectation("invalidFMSApplication");
        public static const IO_ERROR:NetConnectionExpectation = new NetConnectionExpectation("IOerror");
        public static const ARGUMENT_ERROR:NetConnectionExpectation = new NetConnectionExpectation("argumentError");
        public static const SECURITY_ERROR:NetConnectionExpectation = new NetConnectionExpectation("securityError");
        public static const CONNECT_WITH_FMTA:NetConnectionExpectation = new NetConnectionExpectation("connectWithFMTA");
        public static const CONNECT_WITH_REDIRECT:NetConnectionExpectation = new NetConnectionExpectation("connectWithRedirect");

        public function NetConnectionExpectation(name:String)
        {
            this.name = name;
            return;
        }// end function

        public function toString() : String
        {
            return this.name;
        }// end function

    }
}
