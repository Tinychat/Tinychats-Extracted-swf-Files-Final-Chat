package com.tinychat.controller.commands.broadcast.media.signals
{
    import com.tinychat.model.media.*;
    import com.tinychat.model.signals.*;

    public class StartMediaBroadcast extends AbstractReadOnlySignal
    {

        public function StartMediaBroadcast()
        {
            super(Media);
            return;
        }// end function

        public function dispatch(param1:Media) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
