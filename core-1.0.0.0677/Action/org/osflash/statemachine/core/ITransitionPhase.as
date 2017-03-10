package org.osflash.statemachine.core
{

    public interface ITransitionPhase
    {

        public function ITransitionPhase();

        function get index() : int;

        function get name() : String;

        function equals(value:Object) : Boolean;

    }
}
