package com.tinychat.controller.commands.trial
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.trial.*;
    import flash.events.*;
    import flash.utils.*;
    import org.osflash.statemachine.core.*;
    import org.robotlegs.mvcs.*;

    public class TrialPopupCountdownCommand extends Command
    {
        public var controller:IFSMController;
        public var triggerStateAction:TriggerStateAction;
        public var trialMode:TrialMode;
        public var subjectToTrial:SubjectToTrialGuard;
        public var broadcasts:RoomBroadcasts;
        private var timer:Timer;
        private static const TIMEOUT:Number = 60000;
        private static var executedOnce:Boolean = false;

        public function TrialPopupCountdownCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (!executedOnce)
            {
            }
            if (this.subjectToTrial.approve())
            {
                this.subjectToTrial.approve();
            }
            if (this.trialHasntRan)
            {
                executedOnce = true;
                this.timer = new Timer(TIMEOUT, 0);
                this.timer.addEventListener(TimerEvent.TIMER, this.timerHandler);
                this.timer.start();
            }
            return;
        }// end function

        private function timerHandler(event:TimerEvent) : void
        {
            if (this.trialHasntRan)
            {
                if (this.broadcasts.all.length > 0)
                {
                }
                if (this.controller.currentStateName == State.APPLICATION.toString())
                {
                    this.stopTimer();
                    this.triggerStateAction.dispatch(StateAction.SHOW_TRIAL_POPUP);
                }
            }
            else
            {
                this.stopTimer();
            }
            return;
        }// end function

        private function get trialHasntRan() : Boolean
        {
            if (!this.trialMode.enabled)
            {
            }
            return !this.trialMode.expired;
        }// end function

        private function stopTimer() : void
        {
            this.timer.removeEventListener(TimerEvent.TIMER, this.timerHandler);
            this.timer.stop();
            return;
        }// end function

    }
}
