package org.osflash.statemachine.core
{

    public interface IFSMController
    {

        public function IFSMController();

        function get currentStateName() : String;

        function get isTransitioning() : Boolean;

        function removeChangedListener(listener:Function) : Function;

        function get referringAction() : String;

        function action(actionName:String, payload:Object = null) : void;

        function addChangedListener(listener:Function) : Function;

        function addChangedListenerOnce(listener:Function) : Function;

        function cancel(reason:String, payload:Object = null) : void;

        function get transitionPhase() : String;

    }
}
