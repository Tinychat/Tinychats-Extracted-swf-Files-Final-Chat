package com.tinychat.ui.skins.gotham.components.social.chat
{
    import com.tinychat.ui.components.social.chat.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class ChatInputSkin extends Skin implements IStateClient2
    {
        private var _423356108promptDisplay2:RichEditableText;
        private var _831827669textDisplay:RichEditableText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_icons_message_text_field_bubble_png_2032046191:Class;
        private var _213507019hostComponent:ChatInput;

        public function ChatInputSkin()
        {
            this._embed_mxml__images_icons_message_text_field_bubble_png_2032046191 = ChatInputSkin__embed_mxml__images_icons_message_text_field_bubble_png_2032046191;
            mx_internal::_document = this;
            this.mxmlContent = [this._ChatInputSkin_Rect1_c(), this._ChatInputSkin_Line1_c(), this._ChatInputSkin_RichEditableText1_i(), this._ChatInputSkin_RichEditableText2_i(), this._ChatInputSkin_BitmapImage1_c()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"over", overrides:[]}), new State({name:"selected", overrides:[]}), new State({name:"disabled", overrides:[]}), new State({name:"normalWithPrompt", overrides:[]}), new State({name:"disabledWithPrompt", overrides:[]})];
            return;
        }// end function

        override public function set moduleFactory(param1:IFlexModuleFactory) : void
        {
            super.moduleFactory = param1;
            if (this.__moduleFactoryInitialized)
            {
                return;
            }
            this.__moduleFactoryInitialized = true;
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        private function _ChatInputSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._ChatInputSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChatInputSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.alpha = 0;
            return _loc_1;
        }// end function

        private function _ChatInputSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.stroke = this._ChatInputSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChatInputSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 11711154;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        private function _ChatInputSkin_RichEditableText1_i() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.left = 10;
            _loc_1.right = 35;
            _loc_1.top = 10;
            _loc_1.bottom = 10;
            _loc_1.verticalCenter = 2;
            _loc_1.id = "promptDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.promptDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "promptDisplay2", this.promptDisplay2);
            return _loc_1;
        }// end function

        private function _ChatInputSkin_RichEditableText2_i() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.left = 10;
            _loc_1.right = 35;
            _loc_1.top = 10;
            _loc_1.bottom = 10;
            _loc_1.verticalCenter = 2;
            _loc_1.widthInChars = 10;
            _loc_1.multiline = false;
            _loc_1.id = "textDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.textDisplay = _loc_1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return _loc_1;
        }// end function

        private function _ChatInputSkin_BitmapImage1_c() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.width = 14;
            _loc_1.height = 12;
            _loc_1.right = 10;
            _loc_1.verticalCenter = 1;
            _loc_1.source = this._embed_mxml__images_icons_message_text_field_bubble_png_2032046191;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function get promptDisplay2() : RichEditableText
        {
            return this._423356108promptDisplay2;
        }// end function

        public function set promptDisplay2(param1:RichEditableText) : void
        {
            var _loc_2:* = this._423356108promptDisplay2;
            if (_loc_2 !== param1)
            {
                this._423356108promptDisplay2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "promptDisplay2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get textDisplay() : RichEditableText
        {
            return this._831827669textDisplay;
        }// end function

        public function set textDisplay(param1:RichEditableText) : void
        {
            var _loc_2:* = this._831827669textDisplay;
            if (_loc_2 !== param1)
            {
                this._831827669textDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ChatInput
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ChatInput) : void
        {
            var _loc_2:* = this._213507019hostComponent;
            if (_loc_2 !== param1)
            {
                this._213507019hostComponent = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
