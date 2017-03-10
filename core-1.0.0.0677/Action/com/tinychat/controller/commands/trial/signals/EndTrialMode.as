package com.tinychat.controller.commands.trial.signals
{
    import com.tinychat.model.signals.*;

    public class EndTrialMode extends AbstractReadOnlySignal
    {

        public function EndTrialMode()
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
