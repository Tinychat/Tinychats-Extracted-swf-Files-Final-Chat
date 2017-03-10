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

    public class TextAreaSkin extends Skin implements IStateClient2
    {
        private var _263438014promptDisplay:Label;
        private var _402164678scroller:Scroller;
        private var _831827669textDisplay:RichEditableText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TextArea;
        private static const focusExclusions:Array = ["textDisplay"];

        public function TextAreaSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._TextAreaSkin_Rect1_c(), this._TextAreaSkin_Rect2_c(), this._TextAreaSkin_Rect3_c(), this._TextAreaSkin_Label1_i(), this._TextAreaSkin_Scroller1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[]}), new State({name:"normalWithPrompt", overrides:[]}), new State({name:"disabledWithPrompt", overrides:[]})];
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

        override public function get focusSkinExclusions() : Array
        {
            return focusExclusions;
        }// end function

        private function _TextAreaSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._TextAreaSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TextAreaSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12763842;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _TextAreaSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._TextAreaSkin_SolidColorStroke2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TextAreaSkin_SolidColorStroke2_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 14277081;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _TextAreaSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 2;
            _loc_1.bottom = 1;
            _loc_1.radiusX = 2;
            _loc_1.fill = this._TextAreaSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TextAreaSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _TextAreaSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 10;
            _loc_1.right = 10;
            _loc_1.verticalCenter = 2;
            _loc_1.id = "promptDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.promptDisplay = _loc_1;
            BindingManager.executeBindings(this, "promptDisplay", this.promptDisplay);
            return _loc_1;
        }// end function

        private function _TextAreaSkin_Scroller1_i() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 10;
            _loc_1.top = 10;
            _loc_1.right = 10;
            _loc_1.bottom = 10;
            _loc_1.minViewportInset = 1;
            _loc_1.measuredSizeIncludesScrollBars = false;
            _loc_1.hasFocusableChildren = false;
            _loc_1.viewport = this._TextAreaSkin_RichEditableText1_i();
            _loc_1.id = "scroller";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.scroller = _loc_1;
            BindingManager.executeBindings(this, "scroller", this.scroller);
            return _loc_1;
        }// end function

        private function _TextAreaSkin_RichEditableText1_i() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.heightInLines = 10;
            _loc_1.widthInChars = 15;
            _loc_1.id = "textDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.textDisplay = _loc_1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return _loc_1;
        }// end function

        public function get promptDisplay() : Label
        {
            return this._263438014promptDisplay;
        }// end function

        public function set promptDisplay(param1:Label) : void
        {
            var _loc_2:* = this._263438014promptDisplay;
            if (_loc_2 !== param1)
            {
                this._263438014promptDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "promptDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get scroller() : Scroller
        {
            return this._402164678scroller;
        }// end function

        public function set scroller(param1:Scroller) : void
        {
            var _loc_2:* = this._402164678scroller;
            if (_loc_2 !== param1)
            {
                this._402164678scroller = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scroller", _loc_2, param1));
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

        public function get hostComponent() : TextArea
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TextArea) : void
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
