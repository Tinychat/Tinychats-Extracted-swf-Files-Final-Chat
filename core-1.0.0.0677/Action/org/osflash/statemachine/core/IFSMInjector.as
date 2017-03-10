package org.osflash.statemachine.core
{

    public interface IFSMInjector
    {

        public function IFSMInjector();

        function inject(statemachine:IStateMachine) : void;

        function destroy() : void;

    }
}
