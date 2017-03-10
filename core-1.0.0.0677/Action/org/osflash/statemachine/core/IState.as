package org.osflash.statemachine.core
{

    public interface IState
    {

        public function IState();

        function removeTrans(action:String) : Boolean;

        function get referringAction() : String;

        function get length() : int;

        function getTarget(action:String) : String;

        function destroy() : void;

        function get name() : String;

        function defineTrans(action:String, target:String) : Boolean;

        function hasTrans(action:String) : Boolean;

    }
}
