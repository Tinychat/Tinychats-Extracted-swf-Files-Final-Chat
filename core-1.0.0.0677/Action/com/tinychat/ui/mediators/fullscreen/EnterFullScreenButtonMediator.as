package com.tinychat.ui.mediators.fullscreen
{
    import com.tinychat.controller.commands.fullscreen.signals.*;
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.trial.*;
    import com.tinychat.ui.components.fullscreen.*;
    import com.tinychat.ui.mediators.general.*;
    import flash.events.*;

    public class EnterFullScreenButtonMediator extends ButtonMediator
    {
        public var enterFullScreen:EnterFullScreen;
        public var isPaidUser:IsPaidUserGuard;
        public var triggerStateAction:TriggerStateAction;
        public var trialMode:TrialMode;
        public var subjectToTrial:SubjectToTrialGuard;
        private var view:EnterFullScreenButton;

        public function EnterFullScreenButtonMediator(param1:EnterFullScreenButton)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.label = "Fullscreen";
            return;
        }// end function

        override protected function clickHandler(event:MouseEvent) : void
        {
            if (!this.isPaidUser.approve())
            {
                this.isPaidUser.approve();
                if (this.trialMode.enabled)
                {
                }
            }
            if (!this.trialMode.expired)
            {
                this.enterFullScreen.dispatch();
            }
            else
            {
                if (!this.trialMode.enabled)
                {
                }
                if (!this.trialMode.expired)
                {
                }
                if (this.subjectToTrial.approve())
                {
                    this.triggerStateAction.dispatch(StateAction.SHOW_TRIAL_POPUP);
                }
                else
                {
                    this.triggerStateAction.dispatch(StateAction.LIMITED_FEATURE);
                }
            }
            return;
        }// end function

    }
}
