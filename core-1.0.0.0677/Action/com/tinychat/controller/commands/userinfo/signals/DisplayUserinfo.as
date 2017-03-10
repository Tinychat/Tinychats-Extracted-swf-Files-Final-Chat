package com.tinychat.controller.commands.userinfo.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;
    import com.tinychat.services.vo.*;

    public class DisplayUserinfo extends AbstractReadOnlySignal
    {

        public function DisplayUserinfo()
        {
            super(TinychatUserinfo, UserIdentity);
            return;
        }// end function

        public function dispatch(param1:TinychatUserinfo, param2:UserIdentity) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
