package com.tinychat.controller.commands.login.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class LoginSuccess extends AbstractReadOnlySignal
    {

        public function LoginSuccess()
        {
            super(UserIdentity);
            return;
        }// end function

        public function dispatch(param1:UserIdentity) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
