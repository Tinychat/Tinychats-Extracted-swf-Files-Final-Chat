package com.tinychat.ui.components.spark
{
    import flash.events.*;
    import flash.ui.*;
    import flashx.textLayout.conversion.*;
    import flashx.textLayout.formats.*;
    import mx.events.*;
    import spark.components.*;

    public class AdvancedTextInput extends TextInput
    {
        public var promptDisplay2:RichEditableText;
        private var _multiline:Boolean;
        private var _promptMessage:String;
        private var _inputEnabled:Boolean;
        private var inFocus:Boolean;
        private var mouseIsOver:Boolean;
        private var multilineChanged:Boolean;
        private var promptMessageChanged:Boolean;
        private var inFocusChanged:Boolean;
        private var valueChanged:Boolean;
        private var inputEnabledChanged:Boolean;
        private static const STATE_OVER:String = "over";
        private static const STATE_SELECTED:String = "selected";
        private static var _skinParts:Object = {promptDisplay2:false, textDisplay:false, promptDisplay:false};

        public function AdvancedTextInput()
        {
            this._inputEnabled = true;
            addEventListener(FlexEvent.VALUE_COMMIT, this.valueCommitHandler);
            addEventListener(MouseEvent.ROLL_OVER, this.rollOverHandler, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.rollOutHandler, false, 0, true);
            return;
        }// end function

        public function set multiline(param1:Boolean) : void
        {
            if (this._multiline != param1)
            {
                this._multiline = param1;
                this.multilineChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get promptMessage() : String
        {
            return this._promptMessage;
        }// end function

        public function set promptMessage(param1:String) : void
        {
            if (this._promptMessage != param1)
            {
                this._promptMessage = param1;
                this.promptMessageChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override public function set text(param1:String) : void
        {
            super.text = "";
            appendText(param1);
            return;
        }// end function

        public function get inputEnabled() : Boolean
        {
            return this._inputEnabled;
        }// end function

        public function set inputEnabled(param1:Boolean) : void
        {
            if (this._inputEnabled != param1)
            {
                this._inputEnabled = param1;
                this.inputEnabledChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.promptDisplay2)
            {
                if (!this.inFocusChanged)
                {
                }
                if (!this.valueChanged)
                {
                }
            }
            if (this.inputEnabledChanged)
            {
                if (this._inputEnabled)
                {
                    if (!this.inFocus)
                    {
                    }
                }
                this.togglePrompt(text == "");
                textDisplay.enabled = this._inputEnabled;
                (textDisplay as RichEditableText).visible = this._inputEnabled;
                this.inputEnabledChanged = false;
                this.inFocusChanged = false;
                this.valueChanged = false;
            }
            if (this.promptMessageChanged)
            {
            }
            if (this.promptDisplay2)
            {
            }
            if (this.promptDisplay2.visible)
            {
                this.updatePromptMessage();
            }
            if (textDisplay)
            {
            }
            if (this.multilineChanged)
            {
                if (this._multiline)
                {
                    (textDisplay as RichEditableText).setStyle("lineBreak", LineBreak.TO_FIT);
                }
                else
                {
                    (textDisplay as RichEditableText).setStyle("lineBreak", LineBreak.EXPLICIT);
                }
                textDisplay.multiline = this._multiline;
                (textDisplay as RichEditableText).heightInLines = this._multiline ? (NaN) : (1);
                this.multilineChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function focusInHandler(event:FocusEvent) : void
        {
            super.focusInHandler(event);
            this.focusChangedHandler(true);
            addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler, true);
            return;
        }// end function

        override protected function focusOutHandler(event:FocusEvent) : void
        {
            super.focusOutHandler(event);
            this.focusChangedHandler(false);
            removeEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler, true);
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            var _loc_2:Boolean = true;
            switch(event.keyCode)
            {
                case Keyboard.ENTER:
                {
                    this.enterKeyDownHandler();
                    break;
                }
                default:
                {
                    _loc_2 = false;
                    break;
                }
            }
            if (_loc_2)
            {
                event.stopImmediatePropagation();
            }
            else
            {
                super.keyDownHandler(event);
            }
            return;
        }// end function

        protected function enterKeyDownHandler() : void
        {
            dispatchEvent(new FlexEvent(FlexEvent.ENTER));
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.inFocus)
            {
                return STATE_SELECTED;
            }
            if (this.mouseIsOver)
            {
                return STATE_OVER;
            }
            return super.getCurrentSkinState();
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.promptDisplay2)
            {
                this.promptDisplay2.focusEnabled = false;
                this.promptDisplay2.editable = false;
                this.promptDisplay2.selectable = false;
                this.promptDisplay2.multiline = false;
                if (getStyle("promptMessageColor"))
                {
                    this.promptDisplay2.setStyle("color", getStyle("promptMessageColor"));
                }
            }
            return;
        }// end function

        protected function updatePromptMessage() : void
        {
            if (this.promptDisplay2.visible)
            {
                this.promptDisplay2.textFlow = TextConverter.importToFlow(this._promptMessage, TextConverter.TEXT_FIELD_HTML_FORMAT);
            }
            else
            {
                this.promptDisplay2.textFlow = null;
            }
            this.promptMessageChanged = false;
            return;
        }// end function

        private function togglePrompt(param1:Boolean) : void
        {
            this.promptDisplay2.visible = param1;
            this.promptDisplay2.includeInLayout = param1;
            this.updatePromptMessage();
            return;
        }// end function

        private function focusChangedHandler(param1:Boolean) : void
        {
            this.inFocus = param1;
            this.inFocusChanged = true;
            invalidateProperties();
            return;
        }// end function

        private function valueCommitHandler(event:FlexEvent) : void
        {
            this.valueChanged = true;
            invalidateProperties();
            return;
        }// end function

        private function rollOverHandler(event:MouseEvent) : void
        {
            if (!event.buttonDown)
            {
                this.mouseIsOver = true;
                invalidateSkinState();
            }
            return;
        }// end function

        private function rollOutHandler(event:MouseEvent) : void
        {
            this.mouseIsOver = false;
            invalidateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
