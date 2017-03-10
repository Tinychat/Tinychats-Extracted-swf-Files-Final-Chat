package org.osflash.statemachine.core
{
    import org.osflash.signals.*;

    public interface ISignalState extends IState
    {

        public function ISignalState();

        function get cancelled() : ISignal;

        function get exitingGuard() : ISignal;

        function get enteringGuard() : ISignal;

        function get tearDown() : ISignal;

        function get hasTearDown() : Boolean;

        function get entered() : ISignal;

        function get hasEnteringGuard() : Boolean;

        function get hasExitingGuard() : Boolean;

        function get hasEntered() : Boolean;

        function get hasCancelled() : Boolean;

    }
}
