package org.osflash.statemachine.core
{

    public interface IStateDecoder
    {

        public function IStateDecoder();

        function destroy() : void;

        function decodeState(stateDef:Object) : IState;

        function getStateList() : Array;

        function isInitial(stateName:String) : Boolean;

        function setData(value:Object) : void;

    }
}
