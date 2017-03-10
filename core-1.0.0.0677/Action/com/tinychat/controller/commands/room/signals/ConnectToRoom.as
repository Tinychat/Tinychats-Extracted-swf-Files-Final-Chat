package com.tinychat.controller.commands.room.signals
{
    import com.tinychat.model.signals.*;

    public class ConnectToRoom extends AbstractReadOnlySignal
    {

        public function ConnectToRoom()
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
