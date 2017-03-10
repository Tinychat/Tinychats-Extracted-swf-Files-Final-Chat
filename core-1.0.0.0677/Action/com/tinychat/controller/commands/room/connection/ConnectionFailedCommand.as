package com.tinychat.controller.commands.room.connection
{
    import com.tinychat.controller.state.*;

    public class ConnectionFailedCommand extends AbstractConnectionFailureCommand
    {

        public function ConnectionFailedCommand()
        {
            super(StateAction.CONNECTION_ATTEMPT_FAILED);
            return;
        }// end function

    }
}
