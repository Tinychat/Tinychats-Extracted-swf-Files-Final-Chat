package org.robotlegs.utilities.macrobot.core
{

    public interface IAsyncCommand
    {

        public function IAsyncCommand();

        function addCompletionListener(listener:Function) : void;

    }
}
