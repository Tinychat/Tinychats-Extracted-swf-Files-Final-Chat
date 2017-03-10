package com.tinychat.model.trial
{
    import flash.events.*;
    import flash.utils.*;
    import org.osflash.signals.*;

    public class TrialMode extends Object
    {
        private var timer:Timer;
        private var _enabled:Boolean;
        private var _expired:Boolean;
        private var _secondsRemaining:int;
        private var _enabledChanged:Signal;
        private var _secondsRemainingChanged:Signal;

        public function TrialMode()
        {
            this._expired = false;
            this._secondsRemaining = -1;
            this._enabledChanged = new Signal(Boolean);
            this._secondsRemainingChanged = new Signal(Number);
            return;
        }// end function

        public function get expired() : Boolean
        {
            return this._expired;
        }// end function

        public function get enabled() : Boolean
        {
            return this._enabled;
        }// end function

        public function get enabledChanged() : ISignal
        {
            return this._enabledChanged;
        }// end function

        public function get secondsRemaining() : int
        {
            return this._secondsRemaining;
        }// end function

        public function get secondsRemainingChanged() : ISignal
        {
            return this._secondsRemainingChanged;
        }// end function

        public function start(param1:Number) : void
        {
            if (!this.timer)
            {
                this.timer = new Timer(1000, param1);
                this.timer.addEventListener(TimerEvent.TIMER, this.timerHandler);
                this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.timerCompleteHandler);
                this.timer.start();
                this.setEnabled(true);
            }
            return;
        }// end function

        private function timerHandler(event:TimerEvent) : void
        {
            this._secondsRemainingChanged.dispatch(this.timer.repeatCount - this.timer.currentCount);
            return;
        }// end function

        private function timerCompleteHandler(event:TimerEvent) : void
        {
            this.timer.removeEventListener(TimerEvent.TIMER, this.timerHandler);
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.timerCompleteHandler);
            this._expired = true;
            this.setEnabled(false);
            return;
        }// end function

        private function setEnabled(param1:Boolean) : void
        {
            if (this._enabled != param1)
            {
                this._enabled = param1;
                this._enabledChanged.dispatch(this._enabled);
            }
            return;
        }// end function

    }
}
