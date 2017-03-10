package org.osflash.statemachine.core
{

    public interface IPayload
    {

        public function IPayload();

        function get isNull() : Boolean;

        function get body() : Object;

    }
}
