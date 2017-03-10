package com.tinychat.controller.commands.broadcast
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.greenroom.*;

    public class StartGreenRoomBroadcastSequenceCommand extends AbstractStartBroadcastSequenceCommand
    {
        public var triggerStateAction:TriggerStateAction;

        public function StartGreenRoomBroadcastSequenceCommand(param1:GreenRoomConnection, param2:GreenRoomBroadcastAuthorization, param3:GreenRoomCameraBroadcasts)
        {
            super(param1, param2, param3, StateAction.AUTHENTICATE_GREENROOM_BROADCAST);
            return;
        }// end function

    }
}
