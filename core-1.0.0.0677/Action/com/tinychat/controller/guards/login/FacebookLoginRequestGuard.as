package com.tinychat.controller.guards.login
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.login.*;

    public class FacebookLoginRequestGuard extends AbstractLoginRequestGuard
    {

        public function FacebookLoginRequestGuard(param1:LoginType = null)
        {
            super(LoginType.FACEBOOK, param1);
            return;
        }// end function

    }
}
