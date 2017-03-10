package org.osflash.statemachine.core
{

    public interface IStateMachine
    {

        public function IStateMachine();

        function onRegister() : void;

        function get currentStateName() : String;

        function hasState(stateName:String) : Boolean;

        function destroy() : void;

        function removeState(stateName:String) : Boolean;

        function registerState(state:IState, initial:Boolean = false) : Boolean;

    }
}
