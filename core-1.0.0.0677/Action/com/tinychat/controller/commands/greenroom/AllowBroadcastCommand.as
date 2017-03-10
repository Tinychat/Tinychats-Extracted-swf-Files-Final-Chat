package com.tinychat.controller.commands.greenroom
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.user.*;
    import org.robotlegs.mvcs.*;

    public class AllowBroadcastCommand extends Command
    {
        public var user:UserIdentity;
        public var sender:PrivateMessageSender;
        public var postChat:PostGlobalNotice;
        public var settings:RoomSettingsProxy;

        public function AllowBroadcastCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.sender.send(UserAction.ALLOW_BROADCAST.input + " " + this.settings.broadcastPassword, this.user);
            var _loc_1:* = "allowed " + this.user.name + " to broadcast";
            if (this.settings.account != "")
            {
                _loc_1 = _loc_1 + (" (" + this.settings.account + ")");
            }
            this.postChat.dispatch(_loc_1);
            return;
        }// end function

    }
}
