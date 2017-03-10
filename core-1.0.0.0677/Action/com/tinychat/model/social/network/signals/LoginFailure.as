package com.tinychat.model.social.network.signals
{
    import com.tinychat.model.signals.*;

    public class LoginFailure extends AbstractReadOnlySignal
    {

        public function LoginFailure()
        {
            return;
        }// end function

        public function dispatch(param1:String) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
