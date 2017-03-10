package com.tinychat.controller.guards.login
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.login.*;

    public class TumblrLoginRequestGuard extends AbstractLoginRequestGuard
    {

        public function TumblrLoginRequestGuard(param1:LoginType = null)
        {
            super(LoginType.TUMBLR, param1);
            return;
        }// end function

    }
}
