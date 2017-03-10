package com.tinychat.controller.commands.broadcast.next
{
    import com.tinychat.controller.commands.broadcast.device.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.connection.*;
    import org.robotlegs.utilities.macrobot.*;

    public class NextModeStartBroadcastSequenceCommand extends SequenceCommand
    {

        public function NextModeStartBroadcastSequenceCommand(param1:RoomConnection, param2:RoomBroadcastAuthorization, param3:RoomCameraBroadcasts)
        {
            atomic = false;
            addCommand(BroadcastDevicesSetupCommand);
            addCommandInstance(new WaitForStateActionCommand(StateAction.COMPLETE));
            addCommandInstance(new NextModeConnectAndBroadcastSequenceCommand(param1, param2, param3));
            return;
        }// end function

    }
}
