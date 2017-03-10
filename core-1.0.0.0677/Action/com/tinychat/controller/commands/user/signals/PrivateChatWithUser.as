package com.tinychat.controller.commands.user.signals
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class PrivateChatWithUser extends Signal
    {

        public function PrivateChatWithUser()
        {
            super(RenameableUser);
            return;
        }// end function

    }
}
