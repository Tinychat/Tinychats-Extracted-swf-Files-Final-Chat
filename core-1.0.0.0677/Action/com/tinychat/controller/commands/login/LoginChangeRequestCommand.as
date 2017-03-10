package com.tinychat.controller.commands.login
{
    import com.tinychat.controller.commands.invite.twitter.signals.*;
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.room.*;
    import org.robotlegs.mvcs.*;

    public class LoginChangeRequestCommand extends Command
    {
        public var roomInfo:RoomSettingsProxy;
        public var loginType:LoginType;
        public var triggerStateAction:TriggerStateAction;
        public var tweetInvite:TwitterWebIntentTweetInvite;
        public var nickIsPredetermined:NickIsPredeterminedGuard;

        public function LoginChangeRequestCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.roomInfo.roomLoginRestriction == RoomLoginRestriction.FACEBOOK)
            {
            }
            if (this.loginType == LoginType.FACEBOOK)
            {
                this.triggerStateAction.dispatch(StateAction.INVITE_FACEBOOK_FRIENDS);
            }
            else
            {
                if (this.roomInfo.roomLoginRestriction == RoomLoginRestriction.TWITTER)
                {
                }
                if (this.loginType == LoginType.TWITTER)
                {
                    this.tweetInvite.dispatch();
                }
                else if (!this.nickIsPredetermined.approve())
                {
                    this.triggerStateAction.dispatch(StateAction.PROMPT_LOGIN);
                }
            }
            return;
        }// end function

    }
}
