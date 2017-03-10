package com.tinychat.model.guards
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.guards.mode.*;

    public class ForcedPush2TalkGuard extends AbstractLiveGuard
    {
        private var flashvars:FlashvarsProxy;
        private var nextMode:IsNextModeGuard;
        private var isntOperator:IsntOperatorGuard;

        public function ForcedPush2TalkGuard(param1:FlashvarsProxy, param2:IsNextModeGuard, param3:IsntOperatorGuard)
        {
            this.flashvars = param1;
            this.nextMode = param2;
            this.isntOperator = param3;
            return;
        }// end function

        override public function approve() : Boolean
        {
            if (this.nextMode.approve())
            {
                return true;
            }
            if (this.flashvars.push2talk)
            {
            }
            return this.isntOperator.approve();
        }// end function

        override protected function enableChangeListening() : void
        {
            this.isntOperator.addChangeListener(this.operatorChanged);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.isntOperator.removeChangeListener(this.operatorChanged);
            return;
        }// end function

        private function operatorChanged(param1:Boolean) : void
        {
            triggerChange();
            return;
        }// end function

    }
}
