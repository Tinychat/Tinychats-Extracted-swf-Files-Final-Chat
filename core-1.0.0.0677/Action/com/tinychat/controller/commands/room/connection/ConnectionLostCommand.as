package com.tinychat.controller.commands.room.connection
{
    import com.tinychat.controller.state.*;

    public class ConnectionLostCommand extends AbstractConnectionFailureCommand
    {

        public function ConnectionLostCommand()
        {
            super(StateAction.CONNECTION_LOST);
            return;
        }// end function

    }
}
