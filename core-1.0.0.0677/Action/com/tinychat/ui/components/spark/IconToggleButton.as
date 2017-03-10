package com.tinychat.ui.components.spark
{
    import flash.events.*;
    import flash.utils.*;
    import spark.components.*;

    public class IconToggleButton extends ToggleButton
    {
        public var iconDisplay2:ImageSourceDisplay;
        private var clickTimer:Timer;
        private var _clickTimeout:Number;
        private var _deactivated:Boolean;
        private var untoggledLabelText:String;
        private var toggledLabelText:String;
        private var labelTextChanged:Boolean;
        private var selectedChanged:Boolean;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function IconToggleButton()
        {
            this._clickTimeout = 0;
            return;
        }// end function

        public function get deactivated() : Boolean
        {
            if (!this._deactivated)
            {
                if (this.clickTimer)
                {
                }
            }
            return this.clickTimer.running;
        }// end function

        public function set deactivated(param1:Boolean) : void
        {
            if (this._deactivated != param1)
            {
                this._deactivated = param1;
                invalidateSkinState();
            }
            return;
        }// end function

        public function setLabels(param1:String, param2:String) : void
        {
            this.untoggledLabelText = param1;
            this.toggledLabelText = param2;
            this.labelTextChanged = true;
            invalidateProperties();
            return;
        }// end function

        public function set clickTimeout(param1:Number) : void
        {
            if (this._clickTimeout != param1)
            {
                this._clickTimeout = param1;
                if (!this.clickTimer)
                {
                    this.clickTimer = new Timer(this._clickTimeout, 1);
                    this.clickTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.clickTimeoutComplete);
                }
                else
                {
                    this.clickTimer.delay = this._clickTimeout;
                }
            }
            return;
        }// end function

        override public function set selected(param1:Boolean) : void
        {
            if (selected != param1)
            {
                super.selected = param1;
                this.selectedChanged = true;
                if (this.iconDisplay2)
                {
                    this.updateIcon();
                }
            }
            return;
        }// end function

        protected function updateLabelText() : void
        {
            if (selected)
            {
            }
            if (this.toggledLabelText)
            {
                label = this.toggledLabelText;
            }
            else
            {
                if (!selected)
                {
                }
                if (this.untoggledLabelText)
                {
                    label = this.untoggledLabelText;
                }
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (!this.labelTextChanged)
            {
            }
            if (this.selectedChanged)
            {
                this.updateLabelText();
                this.labelTextChanged = false;
                this.selectedChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.iconDisplay2)
            {
                this.updateIcon();
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.deactivated)
            {
                if (selected)
                {
                    return "disabledAndSelected";
                }
                return "disabled";
            }
            else
            {
                return super.getCurrentSkinState();
            }
        }// end function

        override protected function buttonReleased() : void
        {
            if (this.deactivated)
            {
                return;
            }
            if (this._clickTimeout > 0)
            {
                this.clickTimer.reset();
                this.clickTimer.start();
                this.deactivated = true;
                dispatchEvent(new Event(Event.CHANGE));
            }
            else
            {
                super.buttonReleased();
            }
            return;
        }// end function

        private function updateIcon() : void
        {
            if (getStyle("iconSelected") != undefined)
            {
                if (!selected)
                {
                    this.iconDisplay2.source = getStyle("icon");
                }
                else
                {
                    this.iconDisplay2.source = getStyle("iconSelected");
                }
            }
            else if (getStyle("icon") != undefined)
            {
                this.iconDisplay2.source = getStyle("icon");
            }
            if (getStyle("iconWidth") != undefined)
            {
                this.iconDisplay2.width = getStyle("iconWidth");
            }
            if (getStyle("iconHeight") != undefined)
            {
                this.iconDisplay2.height = getStyle("iconHeight");
            }
            if (getStyle("iconHorizontalCenter") != undefined)
            {
                this.iconDisplay2.horizontalCenter = getStyle("iconHorizontalCenter");
            }
            if (getStyle("iconVerticalCenter") != undefined)
            {
                this.iconDisplay2.verticalCenter = getStyle("iconVerticalCenter");
            }
            return;
        }// end function

        private function clickTimeoutComplete(event:TimerEvent) : void
        {
            this.deactivated = false;
            invalidateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
