package org.osflash.statemachine.core
{

    public interface IFSMControllerOwner
    {

        public function IFSMControllerOwner();

        function setIsTransition(value:Boolean) : void;

        function destroy() : void;

        function setReferringAction(value:String) : void;

        function setTransitionPhase(value:ITransitionPhase) : void;

        function dispatchChanged(stateName:String) : void;

        function setCurrentState(state:IState) : void;

        function addActionListener(listener:Function) : Function;

        function get hasChangedListener() : Boolean;

        function addCancelListener(listener:Function) : Function;

    }
}
