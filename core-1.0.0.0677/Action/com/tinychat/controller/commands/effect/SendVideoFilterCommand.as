package com.tinychat.controller.commands.effect
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.videoeffects.*;
    import org.robotlegs.mvcs.*;

    public class SendVideoFilterCommand extends Command
    {
        public var user:User;
        public var sender:PrivateMessageSender;
        public var broadcasts:RoomCameraBroadcasts;

        public function SendVideoFilterCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_2:VideoFilter = null;
            var _loc_1:* = this.broadcasts.currentBroadcast;
            if (_loc_1)
            {
            }
            if (_loc_1.videoFilter)
            {
                _loc_2 = _loc_1.videoFilter;
                this.sender.send("/videofilter " + _loc_2.id, this.user);
            }
            return;
        }// end function

    }
}
