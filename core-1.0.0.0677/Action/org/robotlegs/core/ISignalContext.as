package org.robotlegs.core
{

    public interface ISignalContext extends IContext
    {

        public function ISignalContext();

        function get signalCommandMap() : ISignalCommandMap;

        function set signalCommandMap(value:ISignalCommandMap) : void;

    }
}
