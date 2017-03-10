package org.osflash.signals
{

    public interface ISignalOwner extends ISignal, IDispatcher
    {

        public function ISignalOwner();

        function removeAll() : void;

    }
}
