package com.tinychat.controller.commands.greenroom.signal
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class AllowBroadcast extends Signal
    {

        public function AllowBroadcast()
        {
            super(UserIdentity);
            return;
        }// end function

    }
}
