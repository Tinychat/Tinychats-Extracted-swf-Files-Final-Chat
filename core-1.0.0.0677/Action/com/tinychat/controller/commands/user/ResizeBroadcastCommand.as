package com.tinychat.controller.commands.user
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.ui.components.broadcast.lists.*;
    import org.robotlegs.mvcs.*;

    public class ResizeBroadcastCommand extends Command
    {
        public var broadcasts:RoomBroadcastCanvasBroadcasts;
        public var view:RoomBroadcastCanvas;
        public var identity:Identity;

        public function ResizeBroadcastCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.broadcasts.get(this.identity);
            this.view.selectedItem = this.view.selectedItem != _loc_1 ? (_loc_1) : (null);
            return;
        }// end function

    }
}
