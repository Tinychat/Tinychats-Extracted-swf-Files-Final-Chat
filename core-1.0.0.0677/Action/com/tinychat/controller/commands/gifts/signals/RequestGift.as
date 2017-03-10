package com.tinychat.controller.commands.gifts.signals
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class RequestGift extends Signal
    {

        public function RequestGift()
        {
            super(UserIdentity);
            return;
        }// end function

    }
}
