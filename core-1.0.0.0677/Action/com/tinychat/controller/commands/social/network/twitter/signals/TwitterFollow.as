package com.tinychat.controller.commands.social.network.twitter.signals
{
    import com.tinychat.model.signals.*;

    public class TwitterFollow extends AbstractReadOnlySignal
    {

        public function TwitterFollow()
        {
            super(Boolean, String);
            return;
        }// end function

        public function dispatch(param1:Boolean, param2:String = "") : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
