package com.tinychat.controller.commands.login
{
    import com.tinychat.controller.commands.social.network.facebook.signals.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.room.*;
    import org.robotlegs.mvcs.*;

    public class PromptFacebookSharerOnLoginCommand extends Command
    {
        private var userCount:RoomUserCount;
        private var prompt:PromptFacebookInviteStatus;
        private var loginType:LoginType;

        public function PromptFacebookSharerOnLoginCommand(param1:RoomUserCount, param2:PromptFacebookInviteStatus, param3:LoginType = null)
        {
            this.userCount = param1;
            this.prompt = param2;
            this.loginType = param3;
            return;
        }// end function

        override public function execute() : void
        {
            if (this.loginType == LoginType.GUEST)
            {
            }
            if (this.userCount.count > 9)
            {
                this.prompt.dispatch();
            }
            return;
        }// end function

    }
}
