package com.tinychat.controller.commands.settings.signals
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class ConfirmReportUser extends Signal
    {

        public function ConfirmReportUser()
        {
            super(UserIdentity);
            return;
        }// end function

    }
}
