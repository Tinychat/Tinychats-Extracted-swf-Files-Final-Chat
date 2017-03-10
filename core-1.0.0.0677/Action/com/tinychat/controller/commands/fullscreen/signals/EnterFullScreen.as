package com.tinychat.controller.commands.fullscreen.signals
{
    import com.tinychat.model.signals.*;

    public class EnterFullScreen extends AbstractReadOnlySignal
    {

        public function EnterFullScreen()
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
