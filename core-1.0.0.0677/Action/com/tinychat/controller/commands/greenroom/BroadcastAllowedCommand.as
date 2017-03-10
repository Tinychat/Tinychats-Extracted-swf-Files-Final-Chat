package com.tinychat.controller.commands.greenroom
{
    import com.tinychat.controller.commands.broadcast.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.parsers.privatemessage.arguments.*;
    import com.tinychat.model.room.*;
    import org.robotlegs.mvcs.*;

    public class BroadcastAllowedCommand extends Command
    {
        public var args:PrivateMessageAllowBroadcastArguments;
        public var broadcasts:GreenRoomCameraBroadcasts;
        public var settings:RoomSettingsProxy;

        public function BroadcastAllowedCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.args.sender.operator)
            {
            }
            if (this.broadcasts.isBroadcasting)
            {
                this.settings.broadcastPassword = this.args.broadcastPassword;
                this.broadcasts.stop();
                commandMap.execute(FinishGreenRoomBroadcastSequenceCommand);
            }
            return;
        }// end function

    }
}
