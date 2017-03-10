package com.tinychat.controller.commands.settings.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class ConfirmBan extends AbstractReadOnlySignal
    {

        public function ConfirmBan()
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
