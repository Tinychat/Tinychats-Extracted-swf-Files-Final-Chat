package com.tinychat.controller.commands.broadcast.media.send
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.user.*;

    public class CloseMediaBroadcastCommand extends AbstractSendMediaBroadcastCommand
    {
        private var broadcasts:MediaBroadcasts;

        public function CloseMediaBroadcastCommand(param1:MediaBroadcasts)
        {
            this.broadcasts = param1;
            super(param1.currentBroadcast);
            return;
        }// end function

        override protected function performAction(param1:MediaBroadcast) : void
        {
            var _loc_3:CloseMediaNotification = null;
            var _loc_2:* = MediaType.fromBroadcast(param1);
            if (_loc_2)
            {
                _loc_3 = new CloseMediaNotification(_loc_2);
                postChat.dispatch(_loc_3.create(), currentUser);
                sender.sendToAll([UserAction.MEDIA_BROADCAST_CLOSED.input, _loc_2].join(" "));
                this.broadcasts.stop();
            }
            return;
        }// end function

    }
}
