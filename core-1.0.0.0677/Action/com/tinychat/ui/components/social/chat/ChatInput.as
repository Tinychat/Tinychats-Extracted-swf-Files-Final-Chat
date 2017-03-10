package com.tinychat.ui.components.social.chat
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import flash.ui.*;
    import org.osflash.signals.*;

    public class ChatInput extends AdvancedTextInput
    {
        private var messageHistory:MessageHistory;
        private var messageAutoComplete:MessageAutoComplete;
        private var autoCompleting:Boolean;
        private var _chatMessageSubmitted:Signal;
        private static var _skinParts:Object = {promptDisplay2:false, textDisplay:false, promptDisplay:false};

        public function ChatInput()
        {
            maxChars = 720;
            this.messageHistory = new MessageHistory();
            this.messageHistory.add("");
            this.messageAutoComplete = new MessageAutoComplete();
            this._chatMessageSubmitted = new Signal(String);
            addEventListener(FocusEvent.KEY_FOCUS_CHANGE, this.keyFocusChangeHandler, true);
            return;
        }// end function

        public function set historyLimit(param1:uint) : void
        {
            this.messageHistory.limit = param1;
            return;
        }// end function

        public function set autoCompleteDataProvider(param1:Vector.<String>) : void
        {
            this.messageAutoComplete.dataProvider = param1;
            return;
        }// end function

        public function get chatMessageSubmitted() : ISignal
        {
            return this._chatMessageSubmitted;
        }// end function

        override protected function updatePromptMessage() : void
        {
            if (promptDisplay2.textFlow)
            {
                promptDisplay2.textFlow.removeEventListener("link", this.promptLinkHandler);
            }
            super.updatePromptMessage();
            if (promptDisplay2.textFlow)
            {
                promptDisplay2.textFlow.addEventListener("link", this.promptLinkHandler);
            }
            return;
        }// end function

        private function promptLinkHandler(event:Event) : void
        {
            dispatchEvent(new TextEvent(TextEvent.LINK));
            return;
        }// end function

        override protected function focusInHandler(event:FocusEvent) : void
        {
            super.focusInHandler(event);
            addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler, true);
            return;
        }// end function

        override protected function focusOutHandler(event:FocusEvent) : void
        {
            super.focusOutHandler(event);
            removeEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler, true);
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            if (!event.altKey)
            {
            }
            if (!event.shiftKey)
            {
            }
            if (event.ctrlKey)
            {
                super.keyDownHandler(event);
                return;
            }
            var _loc_2:Boolean = true;
            switch(event.keyCode)
            {
                case Keyboard.UP:
                {
                    this.displayNextHistoryMessage();
                    break;
                }
                case Keyboard.DOWN:
                {
                    this.displayPreviousHistoryMessage();
                    break;
                }
                case Keyboard.TAB:
                {
                    this.autoCompleteMessage();
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
            if (event.keyCode != Keyboard.TAB)
            {
                this.autoCompleting = false;
            }
            return;
        }// end function

        override protected function enterKeyDownHandler() : void
        {
            this.submitMessage();
            return;
        }// end function

        private function keyFocusChangeHandler(event:FocusEvent) : void
        {
            if (event.keyCode == Keyboard.TAB)
            {
                event.preventDefault();
            }
            return;
        }// end function

        private function submitMessage() : void
        {
            if (this.messageIsValid)
            {
                this.dispatchMessageSubmitted();
                this.messageHistory.resetIteration();
                this.messageHistory.updateCurrent(text);
                text = "";
                this.messageHistory.add(text);
            }
            return;
        }// end function

        private function get messageIsValid() : Boolean
        {
            return text != "";
        }// end function

        private function dispatchMessageSubmitted() : void
        {
            this._chatMessageSubmitted.dispatch(text);
            return;
        }// end function

        private function displayNextHistoryMessage() : void
        {
            this.messageHistory.updateCurrent(text);
            text = this.messageHistory.next();
            return;
        }// end function

        private function displayPreviousHistoryMessage() : void
        {
            this.messageHistory.updateCurrent(text);
            text = this.messageHistory.previous();
            return;
        }// end function

        private function autoCompleteMessage() : void
        {
            var _loc_2:String = null;
            var _loc_3:String = null;
            var _loc_1:* = new Sentence(text);
            if (this.autoCompleting)
            {
                _loc_2 = this.messageAutoComplete.next();
            }
            else if (!_loc_1.endsWithBlank)
            {
                _loc_2 = this.messageAutoComplete.match(_loc_1.lastWord);
            }
            else
            {
                _loc_2 = this.messageAutoComplete.match("");
            }
            if (_loc_2 != "")
            {
                if (_loc_1.wordCount <= 1)
                {
                    if (!this.autoCompleting)
                    {
                    }
                }
                if (!_loc_1.endsWithBlank)
                {
                    text = _loc_2 + ": ";
                }
                else if (_loc_1.endsWithBlank)
                {
                    text = _loc_1.toString() + _loc_2;
                }
                else
                {
                    _loc_1.lastWord = _loc_2;
                    text = _loc_1.toString();
                }
            }
            this.autoCompleting = true;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
