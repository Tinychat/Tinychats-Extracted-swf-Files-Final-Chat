package com.tinychat.controller.commands.broadcast.authorization
{
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.calls.*;
    import org.robotlegs.mvcs.*;

    public class SendBroadcastTokenCommand extends Command
    {
        private var connection:RoomConnection;
        private var broadcastAuthorization:BroadcastAuthorizationBase;

        public function SendBroadcastTokenCommand(param1:RoomConnection, param2:BroadcastAuthorizationBase)
        {
            this.connection = param1;
            this.broadcastAuthorization = param2;
            return;
        }// end function

        override public function execute() : void
        {
            this.connection.call(new RoomCallBroadcastAuthentication(this.broadcastAuthorization));
            return;
        }// end function

    }
}
