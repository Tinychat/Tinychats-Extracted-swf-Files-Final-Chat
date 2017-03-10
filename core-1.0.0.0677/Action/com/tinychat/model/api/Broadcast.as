package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface Broadcast extends RenameableUser, Disposable
    {

        public function Broadcast();

        function get started() : ISignal;

        function get stopped() : ISignal;

        function get isPlaying() : Boolean;

        function get isClosed() : Boolean;

        function start() : void;

        function stop() : void;

        function close() : void;

    }
}
