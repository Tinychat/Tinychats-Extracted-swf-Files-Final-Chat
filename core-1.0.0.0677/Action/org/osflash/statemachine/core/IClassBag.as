package org.osflash.statemachine.core
{

    public interface IClassBag
    {

        public function IClassBag();

        function destroy() : void;

        function get name() : String;

        function get pkg() : String;

        function get payload() : Class;

        function equals(value:Object) : Boolean;

    }
}
