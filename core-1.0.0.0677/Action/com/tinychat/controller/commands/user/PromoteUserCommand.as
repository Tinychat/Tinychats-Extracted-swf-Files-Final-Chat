package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.controller.commands.utils.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.trial.*;
    import org.robotlegs.mvcs.*;

    public class PromoteUserCommand extends Command
    {
        public var identity:Identity;
        public var isPaidUser:IsPaidUserGuard;
        public var triggerStateAction:TriggerStateAction;
        public var dispatchSignal:DispatchSignal;
        public var trialMode:TrialMode;
        public var subjectToTrial:SubjectToTrialGuard;

        public function PromoteUserCommand()
        {
            return;
        }// end function

        override public function execute() : void
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
                this.dispatchSignal.dispatch(ResizeBroadcast, [this.identity]);
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
                    injector.mapValue(Identity, this.identity);
                    this.triggerStateAction.dispatch(StateAction.TRIAL_RESIZE_VIDEO);
                    injector.unmap(Identity);
                }
                else
                {
                    this.triggerStateAction.dispatch(StateAction.LIMITED_VIDEO_FEATURE);
                }
            }
            return;
        }// end function

    }
}
