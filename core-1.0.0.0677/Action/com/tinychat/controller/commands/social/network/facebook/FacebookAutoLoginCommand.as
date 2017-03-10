package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.controller.commands.login.signals.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.social.network.facebook.*;
    import org.robotlegs.utilities.macrobot.*;

    public class FacebookAutoLoginCommand extends SequenceCommand
    {
        public var loginRequest:LoginRequest;
        public var permissions:FacebookPermissions;
        public var triggerStateAction:TriggerStateAction;

        public function FacebookAutoLoginCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            atomic = false;
            addCommandInstance(new VerifyFacebookSessionCommand(this.permissions, FacebookPermissions.REQUIRED_FOR_APP, 2000));
            addCommandInstance(new TriggerStateActionCommand(StateAction.FACEBOOK_AUTO_LOGIN));
            addCompletionListener(this.completionHandler);
            super.execute();
            return;
        }// end function

        protected function completionHandler(param1:Boolean) : void
        {
            if (param1)
            {
                this.loginRequest.dispatch(LoginType.FACEBOOK);
            }
            else
            {
                this.triggerStateAction.dispatch(StateAction.CONNECTION_ATTEMPT_SUCCESS);
                this.triggerStateAction.dispatch(StateAction.PROMPT_LOGIN);
            }
            return;
        }// end function

    }
}
