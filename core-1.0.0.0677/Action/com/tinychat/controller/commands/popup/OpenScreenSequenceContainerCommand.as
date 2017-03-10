package com.tinychat.controller.commands.popup
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.screensequence.*;
    import com.tinychat.ui.screensequence.*;

    public class OpenScreenSequenceContainerCommand extends OpenPopupCommand
    {
        public var triggerStateAction:TriggerStateAction;
        private var sequence:ScreenSequencer;
        private var container:ScreenSequenceContainer;

        public function OpenScreenSequenceContainerCommand(param1:Boolean = true, param2:Boolean = true)
        {
            this.container = new ScreenSequenceContainer();
            super(this.container, param1, param2);
            return;
        }// end function

        override public function execute() : void
        {
            this.sequence = this.sequencerFactory(this.container);
            this.addScreens(this.sequence);
            this.addListeners();
            this.sequence.start();
            super.execute();
            return;
        }// end function

        protected function sequencerFactory(param1:ScreenSequenceContainer) : ScreenSequencer
        {
            return new ScreenSequencer(injector, param1);
        }// end function

        protected function addScreens(param1:ScreenSequencer) : void
        {
            return;
        }// end function

        protected function completedHandler() : void
        {
            this.dispose();
            this.triggerStateAction.dispatch(StateAction.COMPLETE);
            return;
        }// end function

        protected function canceledHandler() : void
        {
            this.dispose();
            this.triggerStateAction.dispatch(StateAction.CANCEL);
            return;
        }// end function

        protected function interruptedHandler() : void
        {
            this.dispose();
            return;
        }// end function

        protected function dispose() : void
        {
            this.sequence.dispose();
            this.removeListeners();
            return;
        }// end function

        private function addListeners() : void
        {
            this.sequence.completed.addOnce(this.completedHandler);
            this.sequence.canceled.addOnce(this.canceledHandler);
            this.sequence.interrupted.addOnce(this.interruptedHandler);
            return;
        }// end function

        private function removeListeners() : void
        {
            this.sequence.completed.remove(this.completedHandler);
            this.sequence.canceled.remove(this.canceledHandler);
            this.sequence.interrupted.remove(this.interruptedHandler);
            return;
        }// end function

    }
}
