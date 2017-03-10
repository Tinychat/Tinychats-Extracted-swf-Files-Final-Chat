package com.tinychat.controller.commands.broadcast.next
{
    import com.tinychat.controller.commands.room.connection.*;
    import com.tinychat.controller.commands.room.info.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;
    import org.robotlegs.utilities.macrobot.*;

    public class ConnectToNextRoomSequenceCommand extends SequenceCommand
    {
        public var connection:RoomConnection;
        public var settings:RoomSettingsProxy;

        public function ConnectToNextRoomSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            atomic = false;
            addCommand(LoadRoomInfoCommand);
            if (this.connection.connected)
            {
                addCommandInstance(new NextRoomAvailableVerificationCommand(this.settings.name));
                addCommand(DisconnectFromRoomCommand);
            }
            addCommand(NextModeConnectAndBroadcastSequenceCommand);
            super.execute();
            return;
        }// end function

    }
}
