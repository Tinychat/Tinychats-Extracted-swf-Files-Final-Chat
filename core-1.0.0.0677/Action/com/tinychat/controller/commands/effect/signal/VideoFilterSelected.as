package com.tinychat.controller.commands.effect.signal
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;
    import com.tinychat.model.videoeffects.*;

    public class VideoFilterSelected extends AbstractReadOnlySignal
    {

        public function VideoFilterSelected()
        {
            super(Identity, VideoFilter);
            return;
        }// end function

        public function dispatch(param1:Identity, param2:VideoFilter = null) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
