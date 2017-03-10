package com.tinychat.ui.mediators.connection
{
    import com.tinychat.controller.commands.startup.signals.*;
    import com.tinychat.ui.components.connection.*;
    import com.tinychat.ui.mediators.screen.*;

    public class ConnectionRetryScreenBaseMediator extends ScreenMediator
    {
        public var view:ConnectionRetryScreenBase;
        public var triggerStartupSequence:TriggerModeStartupSequence;

        public function ConnectionRetryScreenBaseMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.confirmed.add(this.confirmedHandler);
            this.view.timeoutComplete.add(this.timeoutCompleteHandler);
            this.view.startTimeout(10);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            this.view.timeoutComplete.remove(this.timeoutCompleteHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            this.retryConnecting();
            return;
        }// end function

        private function timeoutCompleteHandler() : void
        {
            this.retryConnecting();
            return;
        }// end function

        private function retryConnecting() : void
        {
            complete();
            this.triggerStartupSequence.dispatch();
            return;
        }// end function

    }
}
