package com.tinychat.ui.mediators.screen
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import org.robotlegs.mvcs.*;

    public class ScreenMediator extends Mediator
    {
        public var triggerStateAction:TriggerStateAction;

        public function ScreenMediator()
        {
            return;
        }// end function

        protected function complete() : void
        {
            this.triggerStateAction.dispatch(StateAction.COMPLETE);
            return;
        }// end function

        protected function canceled() : void
        {
            this.triggerStateAction.dispatch(StateAction.CANCEL);
            return;
        }// end function

    }
}
