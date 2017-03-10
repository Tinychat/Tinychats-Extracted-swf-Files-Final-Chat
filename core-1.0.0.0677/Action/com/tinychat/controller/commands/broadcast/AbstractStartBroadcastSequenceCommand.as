package com.tinychat.controller.commands.broadcast
{
    import com.tinychat.controller.commands.broadcast.authorization.*;
    import com.tinychat.controller.commands.room.info.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.room.connection.*;
    import org.robotlegs.utilities.macrobot.*;

    public class AbstractStartBroadcastSequenceCommand extends SequenceCommand
    {

        public function AbstractStartBroadcastSequenceCommand(param1:RoomConnection, param2:BroadcastAuthorizationBase, param3:CameraBroadcasts, param4:StateAction)
        {
            atomic = false;
            addCommand(LoadRoomInfoCommand);
            addCommandInstance(new TriggerStateActionCommand(param4));
            addCommandInstance(new WaitForStateActionCommand(StateAction.SUCCESS));
            addCommandInstance(new TriggerStateActionCommand(StateAction.SETUP_BROADCAST));
            addCommandInstance(new WaitForStateActionCommand(StateAction.COMPLETE));
            addCommandInstance(new SendBroadcastTokenCommand(param1, param2));
            addCommand(VerifyAvailableBroadcastSlot);
            addCommandInstance(new StartBroadcastCommand(param3));
            return;
        }// end function

    }
}
