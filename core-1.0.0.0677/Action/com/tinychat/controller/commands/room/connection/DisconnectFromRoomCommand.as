package com.tinychat.controller.commands.room.connection
{
    import com.tinychat.model.room.connection.*;
    import org.robotlegs.mvcs.*;

    public class DisconnectFromRoomCommand extends Command
    {
        public var connections:ApplicationConnections;

        public function DisconnectFromRoomCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.connections.disconnect();
            return;
        }// end function

    }
}
