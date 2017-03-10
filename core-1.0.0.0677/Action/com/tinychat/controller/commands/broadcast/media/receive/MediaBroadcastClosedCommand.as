package com.tinychat.controller.commands.broadcast.media.receive
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.parsers.media.arguments.*;

    public class MediaBroadcastClosedCommand extends AbstractReceivedMediaBroadcastCommand
    {

        public function MediaBroadcastClosedCommand(param1:MediaBroadcastClosedArguments)
        {
            super(param1);
            return;
        }// end function

        override protected function performAction() : void
        {
            var _loc_1:CloseMediaNotification = null;
            if (broadcasts)
            {
                _loc_1 = new CloseMediaNotification(MediaType.fromBroadcast(currentBroadcast));
                postChat.dispatch(_loc_1.create(), sender);
                broadcasts.stop();
            }
            return;
        }// end function

    }
}
