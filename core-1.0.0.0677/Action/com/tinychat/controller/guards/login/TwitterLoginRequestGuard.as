package com.tinychat.controller.guards.login
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.login.*;

    public class TwitterLoginRequestGuard extends AbstractLoginRequestGuard
    {

        public function TwitterLoginRequestGuard(param1:LoginType = null)
        {
            super(LoginType.TWITTER, param1);
            return;
        }// end function

    }
}
