package com.tinychat.controller.commands.state.signals
{
    import com.tinychat.controller.state.*;
    import com.tinychat.model.signals.*;

    public class TriggerStateAction extends AbstractReadOnlySignal
    {

        public function TriggerStateAction()
        {
            super(StateAction, Object);
            return;
        }// end function

        public function dispatch(param1:StateAction, param2:Object = null) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
