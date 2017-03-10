package com.tinychat.controller.commands.room
{
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.room.*;
    import org.robotlegs.mvcs.*;

    public class ClearBroadcastPasswordCommand extends Command
    {
        public var flashCookie:FlashCookieProxy;
        public var settings:RoomSettingsProxy;

        public function ClearBroadcastPasswordCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.flashCookie.setRoomBroadcastPassword(this.settings.name, "");
            return;
        }// end function

    }
}
