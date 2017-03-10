package com.tinychat.controller.guards
{
    import com.tinychat.model.guards.*;
    import com.tinychat.model.trial.*;

    public class TrialModeEnabledGuard extends AbstractLiveGuard
    {
        private var trialMode:TrialMode;

        public function TrialModeEnabledGuard(param1:TrialMode)
        {
            this.trialMode = param1;
            return;
        }// end function

        override public function approve() : Boolean
        {
            if (this.trialMode.enabled)
            {
            }
            return !this.trialMode.expired;
        }// end function

        override protected function enableChangeListening() : void
        {
            this.trialMode.enabledChanged.add(this.enabledChangedHandler);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.trialMode.enabledChanged.remove(this.enabledChangedHandler);
            return;
        }// end function

        private function enabledChangedHandler(param1:Boolean) : void
        {
            triggerChange();
            return;
        }// end function

    }
}
