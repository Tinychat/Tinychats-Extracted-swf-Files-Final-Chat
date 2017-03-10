package com.tinychat.controller.commands.utils
{
    import flash.events.*;
    import flash.utils.*;
    import org.robotlegs.utilities.macrobot.*;

    public class AsyncTimeoutCommand extends AsyncCommand
    {
        private var timer:Timer;
        private var _timeout:Number;

        public function AsyncTimeoutCommand(param1:Number) : void
        {
            this._timeout = param1;
            return;
        }// end function

        override public function execute() : void
        {
            if (this.timeout > 0)
            {
                this.timer = new Timer(this.timeout, 1);
                this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.timerCompleteHandler);
                this.timer.start();
                addCompletionListener(this.completionHandler);
            }
            return;
        }// end function

        protected function get timeout() : Number
        {
            return this._timeout;
        }// end function

        protected function timeoutHandler() : void
        {
            dispatchComplete(false);
            return;
        }// end function

        private function timerCompleteHandler(event:TimerEvent) : void
        {
            this.timeoutHandler();
            return;
        }// end function

        private function completionHandler(param1:Boolean) : void
        {
            this.destroyTimer();
            return;
        }// end function

        private function destroyTimer() : void
        {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.timerCompleteHandler);
            this.timer = null;
            return;
        }// end function

    }
}
