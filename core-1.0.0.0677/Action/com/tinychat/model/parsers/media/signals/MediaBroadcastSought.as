package com.tinychat.model.parsers.media.signals
{
    import com.tinychat.model.parsers.media.arguments.*;
    import com.tinychat.model.signals.*;

    public class MediaBroadcastSought extends AbstractReadOnlySignal
    {

        public function MediaBroadcastSought()
        {
            super(MediaBroadcastSoughtArguments);
            return;
        }// end function

        public function dispatch(param1:MediaBroadcastSoughtArguments) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
