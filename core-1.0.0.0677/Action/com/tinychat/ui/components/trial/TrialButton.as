package com.tinychat.ui.components.trial
{
    import com.tinychat.model.trial.*;
    import com.tinychat.ui.components.spark.*;
    import mx.utils.*;

    public class TrialButton extends LinkToggleButton
    {
        private var _countDownText:String;
        private var _endedText:String;
        private var _trialText:String;
        private var _trialMode:TrialMode;
        private var trialModeChanged:Boolean;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function TrialButton()
        {
            return;
        }// end function

        public function set trialMode(param1:TrialMode) : void
        {
            if (this._trialMode != param1)
            {
                if (this._trialMode)
                {
                    this._trialMode.secondsRemainingChanged.remove(this.secondsRemainingChangedHandler);
                }
                this._trialMode = param1;
                if (this._trialMode)
                {
                    this._trialMode.secondsRemainingChanged.add(this.secondsRemainingChangedHandler);
                }
                this.trialModeChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set trialText(param1:String) : void
        {
            this._trialText = param1;
            return;
        }// end function

        public function set countDownText(param1:String) : void
        {
            this._countDownText = param1;
            return;
        }// end function

        public function set endedText(param1:String) : void
        {
            this._endedText = param1;
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.trialModeChanged)
            {
            }
            if (this._trialMode)
            {
                if (this._trialMode.secondsRemaining != 0)
                {
                    label = this._trialText;
                }
                else
                {
                    label = this._endedText;
                }
                this.trialModeChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        private function secondsRemainingChangedHandler(param1:Number) : void
        {
            if (param1 > 0)
            {
                label = StringUtil.substitute(this._countDownText, param1);
            }
            else
            {
                label = this._endedText;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
