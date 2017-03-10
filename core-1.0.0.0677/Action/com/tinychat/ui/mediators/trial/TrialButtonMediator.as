package com.tinychat.ui.mediators.trial
{
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.model.trial.*;
    import com.tinychat.ui.components.trial.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class TrialButtonMediator extends Mediator
    {
        public var view:TrialButton;
        public var trialMode:TrialMode;
        public var startTrial:StartTrialMode;
        public var openUpgradeUrl:OpenUpgradeUrl;
        private static var trialStarted:Boolean;

        public function TrialButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.trialText = "Click to instantly demo HQ video and Fullscreen features!";
            this.view.countDownText = "{0} seconds remains of the trial. Click to upgrade!";
            this.view.endedText = "The trial has expired. Click to upgrade!";
            this.view.trialMode = this.trialMode;
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            if (!trialStarted)
            {
            }
            if (!this.trialMode.expired)
            {
                trialStarted = true;
                this.startTrial.dispatch(StartTrialMode.FULL_SCREEN);
            }
            else
            {
                this.openUpgradeUrl.dispatch();
            }
            return;
        }// end function

    }
}
