package com.tinychat.controller.commands.effect
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.videoeffects.*;
    import org.robotlegs.mvcs.*;

    public class ApplyVideoFilterCommand extends Command
    {
        public var broadcasts:RoomBroadcasts;
        private var broadcastId:Identity;
        private var filter:VideoFilter;

        public function ApplyVideoFilterCommand(param1:Identity, param2:VideoFilter = null)
        {
            this.broadcastId = param1;
            this.filter = param2;
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.broadcasts.get(this.broadcastId) as UserBroadcast;
            if (_loc_1)
            {
                _loc_1.videoFilter = this.filter;
            }
            return;
        }// end function

    }
}
