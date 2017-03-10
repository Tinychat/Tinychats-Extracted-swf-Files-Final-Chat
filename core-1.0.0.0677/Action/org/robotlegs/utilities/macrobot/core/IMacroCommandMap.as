package org.robotlegs.utilities.macrobot.core
{

    public interface IMacroCommandMap extends ICommandMap
    {

        public function IMacroCommandMap();

        function prepare(commandClass:Class, payload:Object = null, payloadClass:Class = null, named:String = "") : Object;

        function executePrepared(command:Object) : void;

    }
}
