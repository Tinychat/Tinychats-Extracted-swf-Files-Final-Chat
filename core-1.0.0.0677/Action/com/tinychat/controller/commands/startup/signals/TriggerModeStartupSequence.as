package com.tinychat.controller.commands.startup.signals
{
    import com.tinychat.model.signals.*;

    public class TriggerModeStartupSequence extends AbstractReadOnlySignal
    {

        public function TriggerModeStartupSequence()
        {
            return;
        }// end function

        public function dispatch() : void
        {
            signal.dispatch();
            return;
        }// end function

    }
}
