package org.osflash.statemachine.transitioning
{

    public class Payload extends Object implements IPayload
    {
        private var _body:Object;

        public function Payload(body:Object)
        {
            _body = body;
            return;
        }// end function

        public function get isNull() : Boolean
        {
            return _body == null;
        }// end function

        public function get body() : Object
        {
            return _body;
        }// end function

    }
}
