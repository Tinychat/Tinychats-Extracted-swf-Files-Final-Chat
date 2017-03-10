package com.tinychat.controller.commands.user.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class ResizeBroadcast extends AbstractReadOnlySignal
    {

        public function ResizeBroadcast()
        {
            super(Identity);
            return;
        }// end function

        public function dispatch(param1:Identity) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
