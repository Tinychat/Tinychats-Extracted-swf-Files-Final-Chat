package com.tinychat.controller.commands.broadcast.media.receive
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.parsers.media.arguments.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.validation.media.*;
    import com.tinychat.model.youtube.*;
    import flash.errors.*;
    import org.robotlegs.mvcs.*;

    public class AbstractReceivedMediaBroadcastCommand extends Command
    {
        public var validator:IsMediaModerator;
        public var postChat:PostMediaNotice;
        public var users:RoomUsers;
        private var args:AbstractMediaBroadcastArguments;

        public function AbstractReceivedMediaBroadcastCommand(param1:AbstractMediaBroadcastArguments)
        {
            this.args = param1;
            return;
        }// end function

        override public function execute() : void
        {
            if (this.validator.isValid(this.args.sender))
            {
                this.performAction();
            }
            return;
        }// end function

        protected function get sender() : User
        {
            return this.users.userFromId(this.args.sender);
        }// end function

        protected function get currentBroadcast() : MediaBroadcast
        {
            return this.broadcasts ? (this.broadcasts.com.tinychat.model.broadcast.media:MediaBroadcasts::currentBroadcast) : (null);
        }// end function

        protected function get broadcasts() : MediaBroadcasts
        {
            var _loc_1:MediaBroadcasts = null;
            switch(this.args.type)
            {
                case MediaType.SOUNDCLOUD:
                {
                    _loc_1 = injector.getInstance(SoundCloudBroadcasts) as MediaBroadcasts;
                    break;
                }
                case MediaType.YOUTUBE:
                {
                    _loc_1 = injector.getInstance(YouTubeBroadcasts) as YouTubeBroadcasts;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return _loc_1;
        }// end function

        protected function performAction() : void
        {
            throw new IllegalOperationError("Must be overridden in subclass.");
        }// end function

    }
}
