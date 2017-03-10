package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.services.social.network.facebook.share.*;
    import org.robotlegs.mvcs.*;

    public class PromptFacebookInviteStatusCommand extends Command
    {
        public var flashvars:FlashvarsProxy;
        private var service:FacebookPromptInviteStatusService;

        public function PromptFacebookInviteStatusCommand(param1:FacebookPromptInviteStatusService)
        {
            this.service = param1;
            return;
        }// end function

        override public function execute() : void
        {
            if (!this.flashvars.nick)
            {
                this.service.post();
            }
            return;
        }// end function

    }
}
