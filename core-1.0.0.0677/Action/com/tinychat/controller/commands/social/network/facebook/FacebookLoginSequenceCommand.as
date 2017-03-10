package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.model.social.network.facebook.*;
    import org.robotlegs.utilities.macrobot.*;

    public class FacebookLoginSequenceCommand extends SequenceCommand
    {
        private var proxy:FacebookLoginProxy;

        public function FacebookLoginSequenceCommand(param1:FacebookLoginProxy)
        {
            this.proxy = param1;
            return;
        }// end function

        override public function execute() : void
        {
            if (this.proxy.isLoggedIn)
            {
                dispatchComplete(true);
            }
            else
            {
                atomic = false;
                addCommand(FacebookLoginCommand);
                addCommand(FacebookLoadPermissionsCommand);
                super.execute();
            }
            return;
        }// end function

    }
}
