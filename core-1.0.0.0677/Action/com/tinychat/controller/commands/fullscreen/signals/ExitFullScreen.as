package com.tinychat.controller.commands.fullscreen.signals
{
    import com.tinychat.model.signals.*;

    public class ExitFullScreen extends AbstractReadOnlySignal
    {

        public function ExitFullScreen()
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
