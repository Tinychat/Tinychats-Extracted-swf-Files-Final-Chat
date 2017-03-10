package com.tinychat.model.social.network.signals
{
    import com.tinychat.model.signals.*;

    public class LoggedIn extends AbstractReadOnlySignal
    {

        public function LoggedIn()
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
