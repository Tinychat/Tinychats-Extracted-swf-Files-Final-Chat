package com.tinychat.ui.skins.gotham.components.moderator
{
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class TopicSelectionScreenSkin extends Skin
    {
        private var _1367724422cancel:Button;
        private var _951117504confirm:Button;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _854753317topicInput:AdvancedTextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TopicSelectionScreen;

        public function TopicSelectionScreenSkin()
        {
            mx_internal::_document = this;
            this.minWidth = 520;
            this.mxmlContent = [this._TopicSelectionScreenSkin_TitleDisplay1_i(), this._TopicSelectionScreenSkin_VGroup1_c()];
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

        private function _TopicSelectionScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 50;
            _loc_1.styleName = "operator";
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _TopicSelectionScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.top = 62;
            _loc_1.left = 20;
            _loc_1.right = 20;
            _loc_1.bottom = 20;
            _loc_1.gap = 12;
            _loc_1.mxmlContent = [this._TopicSelectionScreenSkin_AdvancedTextInput1_i(), this._TopicSelectionScreenSkin_Group1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TopicSelectionScreenSkin_AdvancedTextInput1_i() : AdvancedTextInput
        {
            var _loc_1:* = new AdvancedTextInput();
            _loc_1.percentWidth = 100;
            _loc_1.height = 44;
            _loc_1.id = "topicInput";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.topicInput = _loc_1;
            BindingManager.executeBindings(this, "topicInput", this.topicInput);
            return _loc_1;
        }// end function

        private function _TopicSelectionScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.mxmlContent = [this._TopicSelectionScreenSkin_HGroup1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TopicSelectionScreenSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.gap = 12;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.columnWidth = 100;
            _loc_1.variableColumnWidth = false;
            _loc_1.mxmlContent = [this._TopicSelectionScreenSkin_Button1_i(), this._TopicSelectionScreenSkin_Button2_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TopicSelectionScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "cancel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.cancel = _loc_1;
            BindingManager.executeBindings(this, "cancel", this.cancel);
            return _loc_1;
        }// end function

        private function _TopicSelectionScreenSkin_Button2_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        public function get cancel() : Button
        {
            return this._1367724422cancel;
        }// end function

        public function set cancel(param1:Button) : void
        {
            var _loc_2:* = this._1367724422cancel;
            if (_loc_2 !== param1)
            {
                this._1367724422cancel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get confirm() : Button
        {
            return this._951117504confirm;
        }// end function

        public function set confirm(param1:Button) : void
        {
            var _loc_2:* = this._951117504confirm;
            if (_loc_2 !== param1)
            {
                this._951117504confirm = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirm", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get titleDisplay() : TitleDisplay
        {
            return this._1893287094titleDisplay;
        }// end function

        public function set titleDisplay(param1:TitleDisplay) : void
        {
            var _loc_2:* = this._1893287094titleDisplay;
            if (_loc_2 !== param1)
            {
                this._1893287094titleDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get topicInput() : AdvancedTextInput
        {
            return this._854753317topicInput;
        }// end function

        public function set topicInput(param1:AdvancedTextInput) : void
        {
            var _loc_2:* = this._854753317topicInput;
            if (_loc_2 !== param1)
            {
                this._854753317topicInput = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topicInput", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : TopicSelectionScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TopicSelectionScreen) : void
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
