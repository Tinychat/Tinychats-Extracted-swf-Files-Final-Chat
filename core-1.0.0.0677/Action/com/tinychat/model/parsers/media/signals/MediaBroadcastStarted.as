package com.tinychat.model.parsers.media.signals
{
    import com.tinychat.model.parsers.media.arguments.*;
    import com.tinychat.model.signals.*;

    public class MediaBroadcastStarted extends AbstractReadOnlySignal
    {

        public function MediaBroadcastStarted()
        {
            super(MediaBroadcastStartedArguments);
            return;
        }// end function

        public function dispatch(param1:MediaBroadcastStartedArguments) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
