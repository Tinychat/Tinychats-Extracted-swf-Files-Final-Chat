package com.tinychat.controller.commands.broadcast.media.signals
{
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.signals.*;

    public class AbstractMediaBroadcastSignal extends AbstractReadOnlySignal
    {

        public function AbstractMediaBroadcastSignal()
        {
            super(MediaBroadcast);
            return;
        }// end function

        public function dispatch(param1:MediaBroadcast) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
