package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.connection.calls.signals.*;
    import org.robotlegs.mvcs.*;

    public class ForceRoomPush2TalkCommand extends Command
    {
        public var callRoom:CallRoom;
        public var postNotice:PostActionNotice;

        public function ForceRoomPush2TalkCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.callRoom.dispatch(new RoomCallForcePush2Talk());
            this.postNotice.dispatch("*Push2Talk request sent to all non-moderators.*");
            return;
        }// end function

    }
}
