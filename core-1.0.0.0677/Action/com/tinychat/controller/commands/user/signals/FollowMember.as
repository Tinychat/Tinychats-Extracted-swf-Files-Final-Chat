package com.tinychat.controller.commands.user.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class FollowMember extends AbstractReadOnlySignal
    {

        public function FollowMember()
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
