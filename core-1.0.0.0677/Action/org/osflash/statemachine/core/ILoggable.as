package org.osflash.statemachine.core
{

    public interface ILoggable
    {

        public function ILoggable();

        function log(msg:String) : void;

        function logPhase(phase:ITransitionPhase, stateName:String = "") : void;

    }
}
