package com.tinychat.controller.commands.user.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class BanUser extends AbstractReadOnlySignal
    {

        public function BanUser()
        {
            super(UserIdentity, String);
            return;
        }// end function

        public function dispatch(param1:UserIdentity, param2:String = "") : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
