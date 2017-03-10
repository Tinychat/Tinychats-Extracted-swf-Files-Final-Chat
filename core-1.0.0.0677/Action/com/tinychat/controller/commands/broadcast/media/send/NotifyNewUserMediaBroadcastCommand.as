package com.tinychat.controller.commands.broadcast.media.send
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.youtube.*;
    import org.robotlegs.mvcs.*;

    public class NotifyNewUserMediaBroadcastCommand extends Command
    {
        public var recipient:User;
        public var users:RoomUsers;
        public var broadcasts:YouTubeBroadcasts;
        public var sender:PrivateMessageSender;

        public function NotifyNewUserMediaBroadcastCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.sendIfInitiator(injector.getInstance(YouTubeBroadcasts) as MediaBroadcasts, MediaType.YOUTUBE);
            this.sendIfInitiator(injector.getInstance(SoundCloudBroadcasts) as MediaBroadcasts, MediaType.SOUNDCLOUD);
            return;
        }// end function

        private function sendIfInitiator(param1:MediaBroadcasts, param2:MediaType) : void
        {
            var _loc_4:UserAction = null;
            var _loc_5:String = null;
            var _loc_3:* = param1.currentBroadcast;
            if (_loc_3)
            {
            }
            if (_loc_3.initiator.id == this.users.currentUser.id)
            {
                _loc_4 = _loc_3.isPaused ? (UserAction.MEDIA_BROADCAST_STARTED_PAUSED) : (UserAction.MEDIA_BROADCAST_STARTED);
            }
            if (_loc_4)
            {
                _loc_5 = [_loc_4.input, param2, _loc_3.mediaId, _loc_3.currentTime].join(" ");
                this.sender.send(_loc_5, this.recipient);
            }
            return;
        }// end function

    }
}
