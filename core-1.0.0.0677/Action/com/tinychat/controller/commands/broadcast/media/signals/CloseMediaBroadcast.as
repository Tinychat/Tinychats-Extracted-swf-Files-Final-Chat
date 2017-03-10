package com.tinychat.controller.commands.broadcast.media.signals
{
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.signals.*;

    public class CloseMediaBroadcast extends AbstractReadOnlySignal
    {

        public function CloseMediaBroadcast()
        {
            super(MediaBroadcasts);
            return;
        }// end function

        public function dispatch(param1:MediaBroadcasts) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
