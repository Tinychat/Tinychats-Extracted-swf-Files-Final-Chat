package com.tinychat.controller.commands.broadcast.media.receive
{
    import com.tinychat.model.parsers.media.arguments.*;

    public class MediaBroadcastStartedCommand extends AbstractMediaBroadcastStartedCommand
    {

        public function MediaBroadcastStartedCommand(param1:MediaBroadcastStartedArguments)
        {
            super(param1, false);
            return;
        }// end function

    }
}
