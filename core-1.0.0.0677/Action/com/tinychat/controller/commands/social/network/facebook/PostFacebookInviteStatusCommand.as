package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.services.social.network.facebook.share.*;
    import org.robotlegs.mvcs.*;

    public class PostFacebookInviteStatusCommand extends Command
    {
        private var service:FacebookPostInviteStatusService;
        private var message:String;

        public function PostFacebookInviteStatusCommand(param1:FacebookPostInviteStatusService, param2:String = "")
        {
            this.service = param1;
            this.message = param2;
            return;
        }// end function

        override public function execute() : void
        {
            this.service.post(this.message);
            return;
        }// end function

    }
}
