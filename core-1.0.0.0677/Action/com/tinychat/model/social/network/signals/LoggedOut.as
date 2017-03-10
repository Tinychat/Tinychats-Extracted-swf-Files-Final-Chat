package com.tinychat.model.social.network.signals
{
    import com.tinychat.model.signals.*;

    public class LoggedOut extends AbstractReadOnlySignal
    {

        public function LoggedOut()
        {
            return;
        }// end function

        public function dispatch() : void
        {
            signal.dispatch();
            return;
        }// end function

    }
}
