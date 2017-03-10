package com.tinychat.controller.commands.room.signals
{
    import com.tinychat.model.signals.*;

    public class DisconnectFromRoom extends AbstractReadOnlySignal
    {

        public function DisconnectFromRoom()
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
