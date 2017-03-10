package com.tinychat.controller.commands.broadcast.media.receive
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.parsers.media.arguments.*;

    public class MediaBroadcastPausedCommand extends AbstractReceivedMediaBroadcastCommand
    {

        public function MediaBroadcastPausedCommand(param1:MediaBroadcastPausedArguments)
        {
            super(param1);
            return;
        }// end function

        override protected function performAction() : void
        {
            var _loc_1:PauseMediaNotification = null;
            if (currentBroadcast)
            {
                _loc_1 = new PauseMediaNotification(MediaType.fromBroadcast(currentBroadcast));
                postChat.dispatch(_loc_1.create(), sender);
                currentBroadcast.stop();
            }
            return;
        }// end function

    }
}
