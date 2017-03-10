package com.tinychat.controller.commands.trial.signals
{
    import com.tinychat.model.signals.*;

    public class OpenUpgradeUrl extends AbstractReadOnlySignal
    {

        public function OpenUpgradeUrl()
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
