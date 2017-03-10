package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.facebook.*;
    import org.robotlegs.mvcs.*;

    public class InviteUserCommand extends Command
    {
        public var recipient:UserIdentity;
        public var triggerStateAction:TriggerStateAction;

        public function InviteUserCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.recipient is FacebookUser)
            {
                injector.mapValue(FacebookUser, this.recipient);
                this.triggerStateAction.dispatch(StateAction.INVITE_FACEBOOK_FRIEND);
                injector.unmap(FacebookUser);
            }
            return;
        }// end function

    }
}
