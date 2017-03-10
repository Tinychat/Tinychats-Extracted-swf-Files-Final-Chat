package com.tinychat.controller.commands.trial
{
    import com.tinychat.controller.commands.fullscreen.*;
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.controller.commands.utils.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.trial.*;
    import org.robotlegs.mvcs.*;

    public class StartTrialModeCommand extends Command
    {
        private var type:String;
        private var identity:Identity;
        public var trialMode:TrialMode;
        public var dispatchSignal:DispatchSignal;
        private static const TRIAL_LENGTH_IN_SECONDS:Number = 30;

        public function StartTrialModeCommand(param1:String, param2:Identity = null)
        {
            this.type = param1;
            this.identity = param2;
            return;
        }// end function

        override public function execute() : void
        {
            this.trialMode.start(TRIAL_LENGTH_IN_SECONDS);
            this.trialMode.enabledChanged.addOnce(this.enabledChangedHandler);
            if (this.type == StartTrialMode.RESIZE_VIDEO)
            {
                this.dispatchSignal.dispatch(ResizeBroadcast, [this.identity]);
            }
            else
            {
                commandMap.execute(EnterFullScreenCommand);
            }
            return;
        }// end function

        private function enabledChangedHandler(param1:Boolean) : void
        {
            commandMap.execute(EndTrialModeCommand);
            return;
        }// end function

    }
}
