package com.tinychat.ui.skins.gotham.components.login
{
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class NicknameSelectorSkin extends Skin implements IStateClient2
    {
        private var _951117504confirm:Button;
        private var _909318622statusLabel:Label;
        private var _1170488772usernameField:AdvancedTextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:NicknameSelector;

        public function NicknameSelectorSkin()
        {
            mx_internal::_document = this;
            this.layout = this._NicknameSelectorSkin_VerticalLayout1_c();
            this.mxmlContent = [this._NicknameSelectorSkin_HGroup1_c(), this._NicknameSelectorSkin_Label1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"submitted", overrides:[]})];
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

        private function _NicknameSelectorSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 20;
            return _loc_1;
        }// end function

        private function _NicknameSelectorSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.percentWidth = 100;
            _loc_1.height = 45;
            _loc_1.gap = 20;
            _loc_1.mxmlContent = [this._NicknameSelectorSkin_AdvancedTextInput1_i(), this._NicknameSelectorSkin_Button1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NicknameSelectorSkin_AdvancedTextInput1_i() : AdvancedTextInput
        {
            var _loc_1:* = new AdvancedTextInput();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.id = "usernameField";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.usernameField = _loc_1;
            BindingManager.executeBindings(this, "usernameField", this.usernameField);
            return _loc_1;
        }// end function

        private function _NicknameSelectorSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 85;
            _loc_1.percentHeight = 100;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _NicknameSelectorSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "statusLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.statusLabel = _loc_1;
            BindingManager.executeBindings(this, "statusLabel", this.statusLabel);
            return _loc_1;
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

        public function get statusLabel() : Label
        {
            return this._909318622statusLabel;
        }// end function

        public function set statusLabel(param1:Label) : void
        {
            var _loc_2:* = this._909318622statusLabel;
            if (_loc_2 !== param1)
            {
                this._909318622statusLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get usernameField() : AdvancedTextInput
        {
            return this._1170488772usernameField;
        }// end function

        public function set usernameField(param1:AdvancedTextInput) : void
        {
            var _loc_2:* = this._1170488772usernameField;
            if (_loc_2 !== param1)
            {
                this._1170488772usernameField = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "usernameField", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : NicknameSelector
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:NicknameSelector) : void
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
