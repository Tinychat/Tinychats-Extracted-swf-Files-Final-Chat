package org.robotlegs.core
{
    import org.osflash.signals.*;

    public interface IGuardedSignalCommandMap extends ISignalCommandMap
    {

        public function IGuardedSignalCommandMap();

        function mapGuardedSignal(signal:ISignal, commandClass:Class, guards, oneshot:Boolean = false) : void;

        function mapGuardedSignalClass(signalClass:Class, commandClass:Class, guards, oneShot:Boolean = false) : ISignal;

    }
}
