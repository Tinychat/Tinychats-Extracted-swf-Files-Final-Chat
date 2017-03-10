package com.tinychat.controller.commands.room.connection.callbacks
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.controller.commands.room.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.parsers.fromowner.arguments.*;
    import com.tinychat.model.user.*;
    import org.robotlegs.mvcs.*;

    public class BroadcastClosedCommand extends Command
    {
        public var args:FromOwnerCloseArguments;
        public var usersProxy:RoomUsers;
        public var cameraBroadcasts:RoomCameraBroadcasts;
        public var postNotice:PostActionNotice;
        public var clearBroadcastPassword:ClearBroadcastPassword;
        private static const CLOSED_TIMEOUT:Number = 30000;

        public function BroadcastClosedCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.usersProxy.userFromName(this.args.username);
            if (_loc_1)
            {
            }
            if (this.usersProxy.isCurrentUser(_loc_1))
            {
                this.usersProxy.isCurrentUser(_loc_1);
            }
            if (this.cameraBroadcasts.has(_loc_1))
            {
                this.cameraBroadcasts.stop(true, CLOSED_TIMEOUT);
                this.postNotice.dispatch("*Your broadcast was closed by a moderator. You\'ve been temporarily prevented from broadcasting.*");
                this.clearBroadcastPassword.dispatch();
            }
            return;
        }// end function

    }
}
