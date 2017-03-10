package com.tinychat.ui.components.connection
{
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.utils.*;
    import org.osflash.signals.*;
    import spark.components.supportClasses.*;

    public class ConnectionRetryScreenBase extends TitleWindowElementBase
    {
        public var infoMessage:TextBase;
        private var retryTimeoutSeconds:uint;
        private var retryTimer:Timer;
        private var _timeoutComplete:Signal;
        private var _infoMessageText:String;
        private var infoMessageTextChanged:Boolean;
        private var _statusLabelText:String;
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, infoMessage:true, loadingIndicator:false};

        public function ConnectionRetryScreenBase()
        {
            this._timeoutComplete = new Signal();
            return;
        }// end function

        public function get timeoutComplete() : ISignal
        {
            return this._timeoutComplete;
        }// end function

        public function set infoMessageText(param1:String) : void
        {
            if (this._infoMessageText != param1)
            {
                this._infoMessageText = param1;
                this.infoMessageTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function startTimeout(param1:uint) : void
        {
            if (param1 > 0)
            {
                this.retryTimeoutSeconds = param1;
                if (!this.retryTimer)
                {
                    this.retryTimer = new Timer(1000, param1);
                    this.retryTimer.addEventListener(TimerEvent.TIMER, this.retryTimerTickHandler);
                    this.retryTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.retryTimerCompleteHandler);
                }
                else
                {
                    this.retryTimer.delay = length;
                    this.retryTimer.reset();
                }
                this.retryTimer.start();
                this.updateStatusLabel();
            }
            return;
        }// end function

        override public function set statusLabelText(param1:String) : void
        {
            this._statusLabelText = param1;
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.infoMessage)
            {
            }
            if (this.infoMessageTextChanged)
            {
                this.infoMessage.text = this._infoMessageText;
                this.infoMessageTextChanged = false;
            }
            return;
        }// end function

        private function retryTimerTickHandler(event:TimerEvent) : void
        {
            this.updateStatusLabel();
            return;
        }// end function

        private function retryTimerCompleteHandler(event:TimerEvent) : void
        {
            this._timeoutComplete.dispatch();
            return;
        }// end function

        private function updateStatusLabel() : void
        {
            if (statusLabel)
            {
                super.statusLabelText = StringUtil.substitute(this._statusLabelText, this.retrySecondsRemaining.toString());
            }
            return;
        }// end function

        private function get retrySecondsRemaining() : uint
        {
            if (this.retryTimer)
            {
                return Math.max(0, this.retryTimeoutSeconds - this.retryTimer.currentCount);
            }
            return 0;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
