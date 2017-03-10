package com.tinychat.controller.commands.broadcast
{
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.broadcast.room.*;
    import org.robotlegs.mvcs.*;

    public class StopBroadcastingRequestCommand extends Command
    {
        public var roomCameraBroadcasts:RoomCameraBroadcasts;
        public var greenRoomCameraBroadcasts:GreenRoomCameraBroadcasts;

        public function StopBroadcastingRequestCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.roomCameraBroadcasts.isBroadcasting)
            {
                this.roomCameraBroadcasts.stop();
            }
            if (this.greenRoomCameraBroadcasts.isBroadcasting)
            {
                this.greenRoomCameraBroadcasts.stop();
            }
            return;
        }// end function

    }
}
