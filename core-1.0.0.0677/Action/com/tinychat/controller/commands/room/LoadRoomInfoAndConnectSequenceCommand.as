package com.tinychat.controller.commands.room
{
    import com.tinychat.controller.commands.room.connection.*;
    import com.tinychat.controller.commands.room.info.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadRoomInfoAndConnectSequenceCommand extends SequenceCommand
    {

        public function LoadRoomInfoAndConnectSequenceCommand()
        {
            atomic = false;
            addCommand(DisconnectFromRoomCommand);
            addCommand(LoadRoomInfoSequenceCommand);
            addCommand(ConnectToRoomSequenceCommand);
            return;
        }// end function

    }
}
