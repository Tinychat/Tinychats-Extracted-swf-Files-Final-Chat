package com.tinychat.controller.commands.broadcast.media.send
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.user.*;

    public class SeekMediaBroadcastCommand extends AbstractSendMediaBroadcastCommand
    {

        public function SeekMediaBroadcastCommand(param1:MediaBroadcast)
        {
            super(param1);
            return;
        }// end function

        override protected function performAction(param1:MediaBroadcast) : void
        {
            var _loc_3:SeekMediaNotification = null;
            var _loc_2:* = MediaType.fromBroadcast(param1);
            if (_loc_2)
            {
                _loc_3 = new SeekMediaNotification(_loc_2);
                postChat.dispatch(_loc_3.create(), currentUser);
                sender.sendToAll([UserAction.MEDIA_BROADCAST_SOUGHT.input, _loc_2, param1.currentTime].join(" "));
            }
            return;
        }// end function

    }
}
