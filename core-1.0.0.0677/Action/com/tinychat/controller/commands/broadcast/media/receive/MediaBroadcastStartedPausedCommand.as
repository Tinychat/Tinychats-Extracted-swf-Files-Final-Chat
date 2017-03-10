package com.tinychat.controller.commands.broadcast.media.receive
{
    import com.tinychat.model.parsers.media.arguments.*;

    public class MediaBroadcastStartedPausedCommand extends AbstractMediaBroadcastStartedCommand
    {

        public function MediaBroadcastStartedPausedCommand(param1:MediaBroadcastStartedArguments)
        {
            super(param1, true);
            return;
        }// end function

    }
}
