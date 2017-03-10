package com.tinychat.controller.commands.broadcast.next
{
    import com.tinychat.controller.commands.broadcast.*;
    import com.tinychat.controller.commands.broadcast.authorization.*;
    import com.tinychat.controller.commands.room.connection.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.connection.*;
    import org.robotlegs.utilities.macrobot.*;

    public class NextModeConnectAndBroadcastSequenceCommand extends SequenceCommand
    {

        public function NextModeConnectAndBroadcastSequenceCommand(param1:RoomConnection, param2:RoomBroadcastAuthorization, param3:RoomCameraBroadcasts)
        {
            atomic = false;
            addCommand(ConnectToRoomSequenceCommand);
            addCommand(VerifyAvailableBroadcastSlot);
            addCommandInstance(new TriggerStateActionCommand(StateAction.AUTHENTICATE_ROOM_BROADCAST));
            addCommandInstance(new WaitForStateActionCommand(StateAction.SUCCESS));
            addCommandInstance(new SendBroadcastTokenCommand(param1, param2));
            addCommandInstance(new StartBroadcastCommand(param3));
            return;
        }// end function

    }
}
