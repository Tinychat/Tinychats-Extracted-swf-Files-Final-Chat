package com.tinychat.controller.commands.user.signals
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class IgnoreUser extends Signal
    {

        public function IgnoreUser()
        {
            super(UserIdentity, Boolean);
            return;
        }// end function

    }
}
