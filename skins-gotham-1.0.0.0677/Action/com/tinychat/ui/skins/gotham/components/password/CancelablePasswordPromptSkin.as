package com.tinychat.ui.skins.gotham.components.password
{
    import com.tinychat.ui.components.password.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class CancelablePasswordPromptSkin extends Skin implements IStateClient2
    {
        private var _1367724422cancel:Button;
        private var _951117504confirm:Button;
        private var _386227999passwordField:AdvancedTextInput;
        private var _909318622statusLabel:Label;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:PasswordPromptScreen;

        public function CancelablePasswordPromptSkin()
        {
            mx_internal::_document = this;
            this.width = 350;
            this.layout = this._CancelablePasswordPromptSkin_VerticalLayout1_c();
            this.mxmlContent = [this._CancelablePasswordPromptSkin_TitleDisplay1_i(), this._CancelablePasswordPromptSkin_Label1_i(), this._CancelablePasswordPromptSkin_AdvancedTextInput1_i(), this._CancelablePasswordPromptSkin_HGroup1_c()];
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

        private function _CancelablePasswordPromptSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 20;
            _loc_1.paddingBottom = 20;
            _loc_1.horizontalAlign = "center";
            return _loc_1;
        }// end function

        private function _CancelablePasswordPromptSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.styleName = "password";
            _loc_1.percentWidth = 100;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _CancelablePasswordPromptSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 90;
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

        private function _CancelablePasswordPromptSkin_AdvancedTextInput1_i() : AdvancedTextInput
        {
            var _loc_1:* = new AdvancedTextInput();
            _loc_1.percentWidth = 90;
            _loc_1.height = 45;
            _loc_1.id = "passwordField";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.passwordField = _loc_1;
            BindingManager.executeBindings(this, "passwordField", this.passwordField);
            return _loc_1;
        }// end function

        private function _CancelablePasswordPromptSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.gap = 20;
            _loc_1.columnWidth = 100;
            _loc_1.variableColumnWidth = false;
            _loc_1.mxmlContent = [this._CancelablePasswordPromptSkin_Button1_i(), this._CancelablePasswordPromptSkin_Button2_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _CancelablePasswordPromptSkin_Button1_i() : Button
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

        private function _CancelablePasswordPromptSkin_Button2_i() : Button
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

        public function get passwordField() : AdvancedTextInput
        {
            return this._386227999passwordField;
        }// end function

        public function set passwordField(param1:AdvancedTextInput) : void
        {
            var _loc_2:* = this._386227999passwordField;
            if (_loc_2 !== param1)
            {
                this._386227999passwordField = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "passwordField", _loc_2, param1));
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

        public function get hostComponent() : PasswordPromptScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:PasswordPromptScreen) : void
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
