package com.tinychat.controller.commands.user.signals
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class ReportUser extends Signal
    {

        public function ReportUser()
        {
            super(UserIdentity);
            return;
        }// end function

    }
}
