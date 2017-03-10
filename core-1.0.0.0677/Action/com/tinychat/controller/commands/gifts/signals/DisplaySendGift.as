package com.tinychat.controller.commands.gifts.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class DisplaySendGift extends AbstractReadOnlySignal
    {

        public function DisplaySendGift()
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
