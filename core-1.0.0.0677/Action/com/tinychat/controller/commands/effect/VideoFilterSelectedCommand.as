package com.tinychat.controller.commands.effect
{
    import com.tinychat.controller.commands.effect.signal.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.videoeffects.*;
    import org.robotlegs.mvcs.*;

    public class VideoFilterSelectedCommand extends SignalCommand
    {
        public var apply:ApplyVideoFilter;
        public var sender:PrivateMessageSender;
        public var users:RoomUsers;
        private var broadcastId:Identity;
        private var filter:VideoFilter;

        public function VideoFilterSelectedCommand(param1:Identity, param2:VideoFilter = null)
        {
            this.broadcastId = param1;
            this.filter = param2;
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.filter ? (this.filter.id) : ("null");
            this.sender.sendToAll("/videofilter " + _loc_1, 0);
            this.apply.dispatch(this.broadcastId, this.filter);
            return;
        }// end function

    }
}
