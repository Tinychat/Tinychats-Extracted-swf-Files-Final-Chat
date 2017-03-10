package com.tinychat.controller.commands.room
{
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.calls.*;
    import org.robotlegs.mvcs.*;

    public class CallRoomCommand extends Command
    {
        public var proxy:RoomConnection;
        public var roomMethod:RoomMethod;

        public function CallRoomCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.proxy.call(this.roomMethod);
            return;
        }// end function

    }
}
