package com.tinychat.controller.commands.ban
{
    import com.tinychat.controller.commands.user.*;
    import org.robotlegs.utilities.macrobot.*;

    public class ForgiveBanSequenceCommand extends SequenceCommand
    {

        public function ForgiveBanSequenceCommand(param1:String)
        {
            atomic = false;
            addCommand(RefreshBanListCommand);
            addCommand(ForgiveUserCommand, param1, String);
            return;
        }// end function

    }
}
