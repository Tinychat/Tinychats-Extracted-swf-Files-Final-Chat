package com.tinychat.controller.commands.room.connection.callbacks
{
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.user.*;
    import org.robotlegs.mvcs.*;

    public class KickCommand extends Command
    {
        public var args:RoomCallbackKickArguments;
        public var usersProxy:RoomUsers;

        public function KickCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.args.toUser().id == this.usersProxy.currentUser.id)
            {
                commandMap.execute(BannedCommand);
            }
            return;
        }// end function

    }
}
