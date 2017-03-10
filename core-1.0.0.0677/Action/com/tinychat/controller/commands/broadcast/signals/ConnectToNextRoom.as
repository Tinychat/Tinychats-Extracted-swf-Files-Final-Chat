package com.tinychat.controller.commands.broadcast.signals
{
    import com.tinychat.model.signals.*;

    public class ConnectToNextRoom extends AbstractReadOnlySignal
    {

        public function ConnectToNextRoom()
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
