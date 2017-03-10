package com.tinychat.controller.commands.broadcast.media.send
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.soundcloud.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.youtube.*;
    import org.robotlegs.mvcs.*;

    public class StartMediaBroadcastCommand extends Command
    {
        public var media:Media;
        public var users:RoomUsers;
        public var sender:PrivateMessageSender;
        public var postChat:PostMediaNotice;
        private var broadcasts:MediaBroadcasts;

        public function StartMediaBroadcastCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:MediaType = null;
            var _loc_3:MediaBroadcast = null;
            var _loc_4:StartMediaNotification = null;
            var _loc_2:* = this.users.currentUser;
            if (this.media is YouTubeClip)
            {
                _loc_1 = MediaType.YOUTUBE;
                this.broadcasts = injector.getInstance(YouTubeBroadcasts);
            }
            else if (this.media is SoundCloudTrack)
            {
                _loc_1 = MediaType.SOUNDCLOUD;
                this.broadcasts = injector.getInstance(SoundCloudBroadcasts);
            }
            if (this.broadcasts)
            {
                _loc_3 = this.broadcasts.currentBroadcast;
                _loc_4 = new StartMediaNotification(_loc_1, this.media.title);
                this.postChat.dispatch(_loc_4.create(), _loc_2);
                this.sender.sendToAll([UserAction.MEDIA_BROADCAST_STARTED.input, _loc_1, this.media.id, "0"].join(" "));
                this.broadcasts.start(this.media, 0, _loc_2);
            }
            return;
        }// end function

    }
}
