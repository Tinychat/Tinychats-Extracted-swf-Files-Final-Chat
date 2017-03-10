package com.tinychat.controller.commands.whiteboard
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.room.*;
    import flash.net.*;
    import org.robotlegs.mvcs.*;

    public class OpenWhiteboardCommand extends Command
    {
        public var roomInfo:RoomSettingsProxy;
        public var postChat:PostGlobalNotice;

        public function OpenWhiteboardCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = "http://flockdraw.com/" + this.roomInfo.name;
            navigateToURL(new URLRequest(_loc_1), "_blank");
            this.postChat.dispatch("joined the group whiteboard.", true);
            return;
        }// end function

    }
}
