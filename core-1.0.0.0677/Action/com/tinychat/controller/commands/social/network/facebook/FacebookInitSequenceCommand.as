package com.tinychat.controller.commands.social.network.facebook
{
    import org.robotlegs.utilities.macrobot.*;

    public class FacebookInitSequenceCommand extends SequenceCommand
    {

        public function FacebookInitSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            atomic = false;
            addCommand(LoadFacebookLibraryCommand);
            addCommand(FacebookInitCommand);
            addCommand(FacebookLoadPermissionsCommand);
            super.execute();
            return;
        }// end function

    }
}
