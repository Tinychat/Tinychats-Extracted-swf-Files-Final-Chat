package com.tinychat.controller.commands.user.signals
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class OpUser extends Signal
    {

        public function OpUser()
        {
            super(UserIdentity);
            return;
        }// end function

    }
}
