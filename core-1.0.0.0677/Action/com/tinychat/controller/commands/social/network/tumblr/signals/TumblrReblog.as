package com.tinychat.controller.commands.social.network.tumblr.signals
{
    import com.tinychat.model.signals.*;

    public class TumblrReblog extends AbstractReadOnlySignal
    {

        public function TumblrReblog()
        {
            super(String);
            return;
        }// end function

        public function dispatch(param1:String) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
