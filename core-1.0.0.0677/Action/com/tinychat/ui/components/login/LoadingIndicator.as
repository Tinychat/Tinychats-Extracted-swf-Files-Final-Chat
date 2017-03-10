package com.tinychat.ui.components.login
{
    import org.osflash.signals.*;

    public interface LoadingIndicator extends IEventDispatcher
    {

        public function LoadingIndicator();

        function get loaded() : ISignal;

        function get fadeCompleted() : ISignal;

        function get isLoaded() : Boolean;

        function fade() : void;

        function start() : void;

    }
}
