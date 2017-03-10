package com.tinychat.controller.commands.broadcast
{
    import com.tinychat.controller.state.*;
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.connection.*;

    public class StartRoomBroadcastSequenceCommand extends AbstractStartBroadcastSequenceCommand
    {

        public function StartRoomBroadcastSequenceCommand(param1:RoomConnection, param2:RoomBroadcastAuthorization, param3:RoomCameraBroadcasts)
        {
            super(param1, param2, param3, StateAction.AUTHENTICATE_ROOM_BROADCAST);
            return;
        }// end function

    }
}
