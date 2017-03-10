package com.tinychat.controller.commands.broadcast.media.send
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.user.*;

    public class PauseMediaBroadcastCommand extends AbstractSendMediaBroadcastCommand
    {

        public function PauseMediaBroadcastCommand(param1:MediaBroadcast)
        {
            super(param1);
            return;
        }// end function

        override protected function performAction(param1:MediaBroadcast) : void
        {
            var _loc_3:PauseMediaNotification = null;
            var _loc_2:* = MediaType.fromBroadcast(param1);
            if (_loc_2)
            {
                _loc_3 = new PauseMediaNotification(_loc_2);
                postChat.dispatch(_loc_3.create(), currentUser);
                sender.sendToAll([UserAction.MEDIA_BROADCAST_PAUSED.input, _loc_2].join(" "));
                param1.stop();
            }
            return;
        }// end function

    }
}
