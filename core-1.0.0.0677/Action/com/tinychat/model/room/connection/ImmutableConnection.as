package com.tinychat.model.room.connection
{
    import org.osflash.signals.*;

    public interface ImmutableConnection
    {

        public function ImmutableConnection();

        function get connecting() : Boolean;

        function get connected() : Boolean;

        function get connectionAttemptSuccess() : ISignal;

        function get connectionAttemptFailed() : ISignal;

        function get connectionLost() : ISignal;

        function get connectionClosed() : ISignal;

    }
}
