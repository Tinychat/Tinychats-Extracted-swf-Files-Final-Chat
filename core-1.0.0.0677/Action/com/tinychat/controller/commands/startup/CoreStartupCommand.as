package com.tinychat.controller.commands.startup
{
    import com.tinychat.controller.commands.startup.signals.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.greenroom.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.moderator.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import com.tinychat.model.user.*;
    import flash.net.*;
    import org.robotlegs.mvcs.*;

    public class CoreStartupCommand extends SignalCommand
    {
        public var settings:RoomSettingsProxy;
        public var startupComplete:StartupComplete;

        public function CoreStartupCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            NetConnection.defaultObjectEncoding = ObjectEncoding.AMF0;
            injector.getInstance(RoomUsers);
            injector.getInstance(RoomCameraBroadcasts);
            injector.getInstance(RoomStreamBroadcasts);
            injector.getInstance(GreenRoomCameraBroadcasts);
            injector.getInstance(GreenRoomStreamBroadcasts);
            injector.getInstance(GreenRoomConnectionController);
            injector.getInstance(GreenRoomUsers);
            injector.getInstance(PublicChat);
            injector.getInstance(AutoBanner);
            injector.mapValue(LoginType, LoginType.NOT_LOGGED_IN);
            var _loc_1:* = injector.getInstance(ApplicationConnections);
            _loc_1.addSource(injector.getInstance(RoomConnection));
            _loc_1.addSource(injector.getInstance(GreenRoomConnection));
            this.startupComplete.dispatch();
            return;
        }// end function

    }
}
