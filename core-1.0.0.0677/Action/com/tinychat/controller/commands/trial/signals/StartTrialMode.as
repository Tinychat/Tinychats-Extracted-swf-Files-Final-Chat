package com.tinychat.controller.commands.trial.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class StartTrialMode extends AbstractReadOnlySignal
    {
        public static const FULL_SCREEN:String = "full_screen";
        public static const RESIZE_VIDEO:String = "resize_video";

        public function StartTrialMode()
        {
            super(String, Identity);
            return;
        }// end function

        public function dispatch(param1:String, param2:Identity = null) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
