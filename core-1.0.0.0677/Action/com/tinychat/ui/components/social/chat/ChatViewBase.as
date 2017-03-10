package com.tinychat.ui.components.social.chat
{
    import com.tinychat.model.social.chat.captcha.*;
    import com.tinychat.ui.components.social.chat.list.*;
    import flash.events.*;
    import spark.components.supportClasses.*;

    public class ChatViewBase extends SkinnableComponent
    {
        public var chatList:UserPopupMenuChatList;
        public var chatInput:ChatInput;
        protected var _captcha:ChatCaptcha;
        protected var _canInitiateChatPromptMessage:String;
        protected var _cannotInitiateChatPromptMessage:String;
        private var _chatInputPromptMessage:String;
        private var chatInputPromptMessageChanged:Boolean;
        private var chatInputVisibleChanged:Boolean;
        private var _chatInputVisible:Boolean;
        private static var _skinParts:Object = {chatInput:true, chatList:true};

        public function ChatViewBase()
        {
            this._chatInputVisible = true;
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            return;
        }// end function

        public function set canInitiateChatPromptMessage(param1:String) : void
        {
            if (this._canInitiateChatPromptMessage != param1)
            {
                this._canInitiateChatPromptMessage = param1;
                this.updateChatInputState();
            }
            return;
        }// end function

        public function set cannotInitiateChatPromptMessage(param1:String) : void
        {
            if (this._cannotInitiateChatPromptMessage != param1)
            {
                this._cannotInitiateChatPromptMessage = param1;
                this.updateChatInputState();
            }
            return;
        }// end function

        public function set chatInputPromptMessage(param1:String) : void
        {
            if (this._chatInputPromptMessage != param1)
            {
                this._chatInputPromptMessage = param1;
                this.chatInputPromptMessageChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set captcha(param1:ChatCaptcha) : void
        {
            if (this._captcha)
            {
                this._captcha.keyChanged.remove(this.updateChatInputState);
            }
            this._captcha = param1;
            if (this._captcha)
            {
                this._captcha.keyChanged.add(this.updateChatInputState);
            }
            this.updateChatInputState();
            return;
        }// end function

        protected function get inputEnabled() : Boolean
        {
            throw new Error("Must be overridden in sub-class");
        }// end function

        protected function updateChatInputState() : void
        {
            var _loc_1:String = "";
            this.chatInput.inputEnabled = this.inputEnabled;
            if (this.inputEnabled)
            {
                _loc_1 = this._canInitiateChatPromptMessage;
            }
            else
            {
                this.chatInput.text = "";
                _loc_1 = this._cannotInitiateChatPromptMessage;
            }
            this.chatInputPromptMessage = _loc_1;
            invalidateProperties();
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.chatInputPromptMessageChanged)
            {
            }
            if (this.chatInput)
            {
                this.chatInput.promptMessage = this._chatInputPromptMessage;
                this.chatInputPromptMessageChanged = false;
            }
            if (this.chatInputVisibleChanged)
            {
            }
            if (this.chatInput)
            {
                this.chatInput.visible = this._chatInputVisible;
                this.chatInput.includeInLayout = this._chatInputVisible;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            if (param2 == this.chatInput)
            {
                this.updateChatInputState();
                this.chatInput.addEventListener(TextEvent.LINK, this.linkHandler);
            }
            return;
        }// end function

        private function linkHandler(event:Event) : void
        {
            this._captcha.prompt();
            return;
        }// end function

        private function set chatInputVisible(param1:Boolean) : void
        {
            if (this._chatInputVisible != param1)
            {
                this._chatInputVisible = param1;
                this.chatInputVisibleChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            stage.addEventListener(FullScreenEvent.FULL_SCREEN, this.fullScreenHandler);
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            stage.removeEventListener(FullScreenEvent.FULL_SCREEN, this.fullScreenHandler);
            return;
        }// end function

        private function fullScreenHandler(event:FullScreenEvent) : void
        {
            if (event.fullScreen)
            {
                if (event.fullScreen)
                {
                }
            }
            this.chatInputVisible = stage.displayState == "fullScreenInteractive";
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
