package com.tinychat.controller.commands.userinfo.signals
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class RequestUserinfo extends Signal
    {

        public function RequestUserinfo()
        {
            super(UserIdentity);
            return;
        }// end function

    }
}
