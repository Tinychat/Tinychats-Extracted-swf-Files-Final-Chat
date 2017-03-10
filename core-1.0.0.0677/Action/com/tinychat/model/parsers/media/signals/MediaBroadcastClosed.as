package com.tinychat.model.parsers.media.signals
{
    import com.tinychat.model.parsers.media.arguments.*;
    import com.tinychat.model.signals.*;

    public class MediaBroadcastClosed extends AbstractReadOnlySignal
    {

        public function MediaBroadcastClosed()
        {
            super(MediaBroadcastClosedArguments);
            return;
        }// end function

        public function dispatch(param1:MediaBroadcastClosedArguments) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
