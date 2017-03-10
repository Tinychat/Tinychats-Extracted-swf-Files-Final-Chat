package com.tinychat.controller.commands.settings
{
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;

    public class ConfirmReportUserCommand extends ConfirmUserActionBaseCommand
    {

        public function ConfirmReportUserCommand(param1:UserIdentity)
        {
            super(StateAction.CONFIRM_REPORT_USER, param1);
            return;
        }// end function

    }
}
