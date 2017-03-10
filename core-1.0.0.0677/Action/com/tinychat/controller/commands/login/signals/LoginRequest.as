package com.tinychat.controller.commands.login.signals
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.signals.*;

    public class LoginRequest extends AbstractReadOnlySignal
    {

        public function LoginRequest()
        {
            super(LoginType, Boolean, Object);
            return;
        }// end function

        public function dispatch(param1:LoginType, param2:Boolean = true, param3:Object = null) : void
        {
            signal.dispatch(param1, param2, param3 ? (param3) : ({}));
            return;
        }// end function

    }
}
