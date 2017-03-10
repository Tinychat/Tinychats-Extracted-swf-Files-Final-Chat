package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.connection.calls.signals.*;
    import org.robotlegs.mvcs.*;

    public class MuteRoomCommand extends Command
    {
        public var callRoom:CallRoom;
        public var postNotice:PostActionNotice;

        public function MuteRoomCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.callRoom.dispatch(new RoomCallMuteRoom());
            this.postNotice.dispatch("*Non-moderators have been muted.*");
            return;
        }// end function

    }
}
