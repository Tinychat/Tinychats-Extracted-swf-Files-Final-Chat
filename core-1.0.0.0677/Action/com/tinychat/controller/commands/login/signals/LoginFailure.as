package com.tinychat.controller.commands.login.signals
{
    import org.osflash.signals.*;

    public class LoginFailure extends Signal
    {

        public function LoginFailure()
        {
            super(String);
            return;
        }// end function

    }
}
