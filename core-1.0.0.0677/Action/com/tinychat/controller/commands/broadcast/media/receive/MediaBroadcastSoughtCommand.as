package com.tinychat.controller.commands.broadcast.media.receive
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.parsers.media.arguments.*;

    public class MediaBroadcastSoughtCommand extends AbstractReceivedMediaBroadcastCommand
    {
        private var args:MediaBroadcastSoughtArguments;

        public function MediaBroadcastSoughtCommand(param1:MediaBroadcastSoughtArguments)
        {
            this.args = param1;
            super(param1);
            return;
        }// end function

        override protected function performAction() : void
        {
            var _loc_1:SeekMediaNotification = null;
            if (currentBroadcast)
            {
                _loc_1 = new SeekMediaNotification(MediaType.fromBroadcast(currentBroadcast));
                postChat.dispatch(_loc_1.create(), sender);
                currentBroadcast.seekTo(this.args.currentTime, false);
            }
            return;
        }// end function

    }
}
