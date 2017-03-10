package com.tinychat.ui.skins.gotham.components.social.buttonbar
{
    import com.tinychat.ui.components.social.buttonbar.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.filters.*;
    import spark.primitives.*;

    public class UserCountIndicatorSkin extends Skin
    {
        private var _831827669textDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:UserCountIndicator;

        public function UserCountIndicatorSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._UserCountIndicatorSkin_Rect1_c(), this._UserCountIndicatorSkin_Label1_i()];
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

        private function _UserCountIndicatorSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.topLeftRadiusX = 2;
            _loc_1.topRightRadiusX = 2;
            _loc_1.bottomLeftRadiusX = 3;
            _loc_1.bottomRightRadiusX = 3;
            _loc_1.fill = this._UserCountIndicatorSkin_SolidColor1_c();
            _loc_1.filters = [this._UserCountIndicatorSkin_DropShadowFilter1_c()];
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _UserCountIndicatorSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 15744293;
            return _loc_1;
        }// end function

        private function _UserCountIndicatorSkin_DropShadowFilter1_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.angle = 90;
            _loc_1.color = 0;
            _loc_1.alpha = 0.8;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            _loc_1.distance = 1;
            return _loc_1;
        }// end function

        private function _UserCountIndicatorSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.verticalCenter = 1;
            _loc_1.setStyle("paddingLeft", 3);
            _loc_1.setStyle("paddingRight", 3);
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("fontWeight", "bold");
            _loc_1.setStyle("color", 16777215);
            _loc_1.id = "textDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.textDisplay = _loc_1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return _loc_1;
        }// end function

        public function get textDisplay() : Label
        {
            return this._831827669textDisplay;
        }// end function

        public function set textDisplay(param1:Label) : void
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

        public function get hostComponent() : UserCountIndicator
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:UserCountIndicator) : void
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
