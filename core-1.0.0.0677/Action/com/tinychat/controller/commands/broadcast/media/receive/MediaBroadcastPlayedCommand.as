package com.tinychat.controller.commands.broadcast.media.receive
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.parsers.media.arguments.*;

    public class MediaBroadcastPlayedCommand extends AbstractReceivedMediaBroadcastCommand
    {
        private var args:MediaBroadcastPlayedArguments;

        public function MediaBroadcastPlayedCommand(param1:MediaBroadcastPlayedArguments)
        {
            this.args = param1;
            super(param1);
            return;
        }// end function

        override protected function performAction() : void
        {
            var _loc_1:PlayMediaNotification = null;
            if (currentBroadcast)
            {
                _loc_1 = new PlayMediaNotification(MediaType.fromBroadcast(currentBroadcast));
                postChat.dispatch(_loc_1.create(), sender);
                currentBroadcast.seekTo(this.args.currentTime, false);
                currentBroadcast.play();
            }
            return;
        }// end function

    }
}
