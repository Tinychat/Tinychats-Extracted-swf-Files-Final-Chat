package com.tinychat.controller.commands.user
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import org.robotlegs.mvcs.*;

    public class HideBroadcastCommand extends Command
    {
        public var broadcasts:RoomBroadcastCanvasBroadcasts;
        public var identity:Identity;

        public function HideBroadcastCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.broadcasts.get(this.identity) as Hideable;
            if (_loc_1)
            {
                _loc_1.hide();
            }
            return;
        }// end function

    }
}
