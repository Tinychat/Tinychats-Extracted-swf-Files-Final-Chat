package com.tinychat.ui.skins.gotham.components.spark
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class VScrollBarSkin extends Skin implements IStateClient2
    {
        private var _853009829decrementButton:Button;
        private var _454226047incrementButton:Button;
        private var _110342614thumb:Button;
        private var _110621003track:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:VScrollBar;

        public function VScrollBarSkin()
        {
            mx_internal::_document = this;
            this.minWidth = 11;
            this.minHeight = 35;
            this.mxmlContent = [this._VScrollBarSkin_Rect1_c(), this._VScrollBarSkin_Rect2_c(), this._VScrollBarSkin_Button1_i(), this._VScrollBarSkin_Button2_i(), this._VScrollBarSkin_Button3_i(), this._VScrollBarSkin_Button4_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"inactive", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5}), new SetProperty().initializeFromObject({target:"decrementButton", name:"enabled", value:false}), new SetProperty().initializeFromObject({target:"thumb", name:"visible", value:false}), new SetProperty().initializeFromObject({target:"incrementButton", name:"enabled", value:false})]})];
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

        private function _VScrollBarSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._VScrollBarSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13750737;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.fill = this._VScrollBarSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.entries = [this._VScrollBarSkin_GradientEntry1_c(), this._VScrollBarSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15066597;
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15921906;
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.height = 11;
            _loc_1.focusEnabled = false;
            _loc_1.setStyle("skinClass", ScrollBarUpButtonSkin);
            _loc_1.id = "decrementButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.decrementButton = _loc_1;
            BindingManager.executeBindings(this, "decrementButton", this.decrementButton);
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_Button2_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 11;
            _loc_1.bottom = 11;
            _loc_1.height = 54;
            _loc_1.focusEnabled = false;
            _loc_1.setStyle("skinClass", VScrollBarTrackSkin);
            _loc_1.id = "track";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.track = _loc_1;
            BindingManager.executeBindings(this, "track", this.track);
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_Button3_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.minHeight = 50;
            _loc_1.minWidth = 7;
            _loc_1.focusEnabled = false;
            _loc_1.setStyle("skinClass", VScrollBarThumbSkin);
            _loc_1.id = "thumb";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.thumb = _loc_1;
            BindingManager.executeBindings(this, "thumb", this.thumb);
            return _loc_1;
        }// end function

        private function _VScrollBarSkin_Button4_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.bottom = 1;
            _loc_1.height = 11;
            _loc_1.focusEnabled = false;
            _loc_1.setStyle("skinClass", ScrollBarDownButtonSkin);
            _loc_1.id = "incrementButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.incrementButton = _loc_1;
            BindingManager.executeBindings(this, "incrementButton", this.incrementButton);
            return _loc_1;
        }// end function

        public function get decrementButton() : Button
        {
            return this._853009829decrementButton;
        }// end function

        public function set decrementButton(param1:Button) : void
        {
            var _loc_2:* = this._853009829decrementButton;
            if (_loc_2 !== param1)
            {
                this._853009829decrementButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decrementButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get incrementButton() : Button
        {
            return this._454226047incrementButton;
        }// end function

        public function set incrementButton(param1:Button) : void
        {
            var _loc_2:* = this._454226047incrementButton;
            if (_loc_2 !== param1)
            {
                this._454226047incrementButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "incrementButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get thumb() : Button
        {
            return this._110342614thumb;
        }// end function

        public function set thumb(param1:Button) : void
        {
            var _loc_2:* = this._110342614thumb;
            if (_loc_2 !== param1)
            {
                this._110342614thumb = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thumb", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get track() : Button
        {
            return this._110621003track;
        }// end function

        public function set track(param1:Button) : void
        {
            var _loc_2:* = this._110621003track;
            if (_loc_2 !== param1)
            {
                this._110621003track = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "track", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : VScrollBar
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:VScrollBar) : void
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
