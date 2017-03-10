package com.tinychat.controller.commands.room.connection.callbacks
{
    import com.tinychat.controller.commands.room.signals.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.state.*;

    public class BannedCommand extends TriggerStateActionCommand
    {
        public var disconnectFromRoom:DisconnectFromRoom;
        public var clearBroadcastPassword:ClearBroadcastPassword;

        public function BannedCommand()
        {
            super(StateAction.BANNED);
            return;
        }// end function

        override public function execute() : void
        {
            this.clearBroadcastPassword.dispatch();
            this.disconnectFromRoom.dispatch();
            super.execute();
            return;
        }// end function

    }
}
