package org.osflash.statemachine.core
{

    public interface ITransitionController
    {

        public function ITransitionController();

        function get isTransitioning() : Boolean;

        function transition(targetState:IState, payload:Object = null) : void;

        function set actionCallback(value:Function) : void;

        function get currentState() : IState;

        function destroy() : void;

    }
}
