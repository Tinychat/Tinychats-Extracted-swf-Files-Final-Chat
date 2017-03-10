package com.tinychat.model.parsers.media.signals
{
    import com.tinychat.model.parsers.media.arguments.*;
    import com.tinychat.model.signals.*;

    public class MediaBroadcastPaused extends AbstractReadOnlySignal
    {

        public function MediaBroadcastPaused()
        {
            super(MediaBroadcastPausedArguments);
            return;
        }// end function

        public function dispatch(param1:MediaBroadcastPausedArguments) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
