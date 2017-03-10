package com.tinychat.model.parsers.media.signals
{
    import com.tinychat.model.parsers.media.arguments.*;
    import com.tinychat.model.signals.*;

    public class MediaBroadcastPlayed extends AbstractReadOnlySignal
    {

        public function MediaBroadcastPlayed()
        {
            super(MediaBroadcastPlayedArguments);
            return;
        }// end function

        public function dispatch(param1:MediaBroadcastPlayedArguments) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
