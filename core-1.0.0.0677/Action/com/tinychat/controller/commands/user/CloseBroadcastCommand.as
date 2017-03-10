package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.broadcast.media.signals.*;
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.connection.calls.signals.*;
    import com.tinychat.model.youtube.*;
    import org.robotlegs.mvcs.*;

    public class CloseBroadcastCommand extends Command
    {
        public var identity:Identity;
        public var broadcasts:RoomBroadcastCanvasBroadcasts;
        public var callRoom:CallRoom;
        public var postChat:PostGlobalNotice;
        public var postNotice:PostActionNotice;
        public var closeMediaBroadcast:CloseMediaBroadcast;
        public var playlist:PlaylistProxy;

        public function CloseBroadcastCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_2:MediaBroadcasts = null;
            var _loc_1:* = this.broadcasts.get(this.identity);
            if (_loc_1)
            {
                if (_loc_1 is StreamBroadcast)
                {
                    this.callRoom.dispatch(new RoomCallCloseBroadcast(_loc_1));
                    this.postNotice.dispatch("*Sent close request to " + _loc_1.name + ".*");
                    this.postChat.dispatch("closed: " + _loc_1.name);
                }
                else if (_loc_1 is MediaBroadcast)
                {
                    if (_loc_1 is YouTubeBroadcast)
                    {
                        this.playlist.stop();
                        _loc_2 = injector.getInstance(YouTubeBroadcasts) as MediaBroadcasts;
                    }
                    else if (_loc_1 is SoundCloudBroadcast)
                    {
                        _loc_2 = injector.getInstance(SoundCloudBroadcasts) as MediaBroadcasts;
                    }
                    if (_loc_2)
                    {
                        this.closeMediaBroadcast.dispatch(_loc_2);
                    }
                }
            }
            return;
        }// end function

    }
}
