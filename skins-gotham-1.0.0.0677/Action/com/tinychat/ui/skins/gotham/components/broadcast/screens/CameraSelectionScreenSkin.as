package com.tinychat.ui.skins.gotham.components.broadcast.screens
{
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.components.broadcast.selectors.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class CameraSelectionScreenSkin extends Skin implements IStateClient2
    {
        private var _951117504confirm:Button;
        private var _1812507896selectionInfoDisplay:Label;
        private var _1191572447selector:CameraSelector;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _1985582148tosInfoDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:CameraSelectionScreen;

        public function CameraSelectionScreenSkin()
        {
            mx_internal::_document = this;
            this.maxWidth = 490;
            this.maxHeight = 450;
            this.mxmlContent = [this._CameraSelectionScreenSkin_TitleDisplay1_i(), this._CameraSelectionScreenSkin_Label1_i(), this._CameraSelectionScreenSkin_CameraSelector1_i(), this._CameraSelectionScreenSkin_Button1_i(), this._CameraSelectionScreenSkin_Label2_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[]})];
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

        private function _CameraSelectionScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 50;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _CameraSelectionScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.horizontalCenter = 0;
            _loc_1.top = 65;
            _loc_1.id = "selectionInfoDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.selectionInfoDisplay = _loc_1;
            BindingManager.executeBindings(this, "selectionInfoDisplay", this.selectionInfoDisplay);
            return _loc_1;
        }// end function

        private function _CameraSelectionScreenSkin_CameraSelector1_i() : CameraSelector
        {
            var _loc_1:* = new CameraSelector();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 75;
            _loc_1.bottom = 75;
            _loc_1.id = "selector";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.selector = _loc_1;
            BindingManager.executeBindings(this, "selector", this.selector);
            return _loc_1;
        }// end function

        private function _CameraSelectionScreenSkin_Button1_i() : Button
        {
            var _loc_1:Button = null;
            _loc_1 = new Button();
            _loc_1.width = 130;
            _loc_1.horizontalCenter = 0;
            _loc_1.bottom = 35;
            _loc_1.useHandCursor = true;
            _loc_1.buttonMode = true;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _CameraSelectionScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.horizontalCenter = 0;
            _loc_1.bottom = 15;
            _loc_1.id = "tosInfoDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.tosInfoDisplay = _loc_1;
            BindingManager.executeBindings(this, "tosInfoDisplay", this.tosInfoDisplay);
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

        public function get selectionInfoDisplay() : Label
        {
            return this._1812507896selectionInfoDisplay;
        }// end function

        public function set selectionInfoDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1812507896selectionInfoDisplay;
            if (_loc_2 !== param1)
            {
                this._1812507896selectionInfoDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectionInfoDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get selector() : CameraSelector
        {
            return this._1191572447selector;
        }// end function

        public function set selector(param1:CameraSelector) : void
        {
            var _loc_2:* = this._1191572447selector;
            if (_loc_2 !== param1)
            {
                this._1191572447selector = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selector", _loc_2, param1));
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

        public function get tosInfoDisplay() : Label
        {
            return this._1985582148tosInfoDisplay;
        }// end function

        public function set tosInfoDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1985582148tosInfoDisplay;
            if (_loc_2 !== param1)
            {
                this._1985582148tosInfoDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tosInfoDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : CameraSelectionScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:CameraSelectionScreen) : void
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
