package com.tinychat.controller.commands.user
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.connection.calls.signals.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.report.*;
    import org.robotlegs.mvcs.*;

    public class SetNicknameRemotelyCommand extends Command
    {
        public var oldNick:String;
        public var users:RoomUsers;
        public var callRoom:CallRoom;
        public var nickLoggingService:NickLoggingService;
        public var settings:RoomSettingsProxy;

        public function SetNicknameRemotelyCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.callRoom.dispatch(new RoomCallNick(this.users.currentUser.name));
            this.nickLoggingService.send(this.oldNick, this.users.currentUser.name, this.settings.rtmp, this.settings.name);
            return;
        }// end function

    }
}
