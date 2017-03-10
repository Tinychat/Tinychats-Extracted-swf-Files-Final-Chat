package com.tinychat.ui.components.controlbar.buttons
{
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;

    public class MicrophoneModeButton extends IconToggleButton
    {
        private var _pushToTalk:Boolean;
        private var _pushToTalkLabel:String;
        private var pushToTalkChanged:Boolean;
        private var pushToTalkLabelChanged:Boolean;
        private static const STATE_PUSHED:String = "pushed";
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function MicrophoneModeButton()
        {
            this._pushToTalk = false;
            return;
        }// end function

        public function set pushToTalkLabel(param1:String) : void
        {
            if (this._pushToTalkLabel != param1)
            {
                this._pushToTalkLabel = param1;
                this.pushToTalkLabelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set pushToTalk(param1:Boolean) : void
        {
            if (this._pushToTalk != param1)
            {
                this._pushToTalk = param1;
                this.pushToTalkChanged = true;
                invalidateSkinState();
            }
            return;
        }// end function

        public function get pressed() : Boolean
        {
            return mouseCaptured;
        }// end function

        override protected function buttonReleased() : void
        {
            if (this._pushToTalk)
            {
                return;
            }
            super.buttonReleased();
            return;
        }// end function

        override protected function mouseEventHandler(event:Event) : void
        {
            super.mouseEventHandler(event);
            if (!deactivated)
            {
            }
            if (this._pushToTalk)
            {
                if (event.type != MouseEvent.MOUSE_DOWN)
                {
                }
            }
            if (event.type == MouseEvent.MOUSE_UP)
            {
                dispatchEvent(new Event(Event.CHANGE));
            }
            return;
        }// end function

        override protected function updateLabelText() : void
        {
            if (this._pushToTalk)
            {
                label = this._pushToTalkLabel;
            }
            else
            {
                super.updateLabelText();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (!this.pushToTalkChanged)
            {
            }
            if (this.pushToTalkLabelChanged)
            {
                this.updateLabelText();
                this.pushToTalkChanged = false;
                this.pushToTalkLabelChanged = false;
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (!deactivated)
            {
                if (mouseCaptured)
                {
                }
                if (this._pushToTalk)
                {
                    return STATE_PUSHED;
                }
            }
            return super.getCurrentSkinState();
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
