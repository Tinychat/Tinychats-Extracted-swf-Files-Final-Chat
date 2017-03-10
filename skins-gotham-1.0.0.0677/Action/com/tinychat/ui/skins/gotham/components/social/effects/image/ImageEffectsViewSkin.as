package com.tinychat.ui.skins.gotham.components.social.effects.image
{
    import com.tinychat.ui.components.social.effects.image.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class ImageEffectsViewSkin extends Skin
    {
        private var _110371416title:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:ImageEffectsView;

        public function ImageEffectsViewSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._ImageEffectsViewSkin_Rect1_c(), this._ImageEffectsViewSkin_VGroup1_c()];
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

        private function _ImageEffectsViewSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._ImageEffectsViewSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ImageEffectsViewSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _ImageEffectsViewSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.top = 0;
            _loc_1.bottom = 35;
            _loc_1.paddingTop = 12;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._ImageEffectsViewSkin_Label1_i(), this._ImageEffectsViewSkin_Line1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _ImageEffectsViewSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.text = "THIS IS IMAGE EFFECTS CONTAINER";
            _loc_1.top = 12;
            _loc_1.id = "title";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.title = _loc_1;
            BindingManager.executeBindings(this, "title", this.title);
            return _loc_1;
        }// end function

        private function _ImageEffectsViewSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.percentWidth = 100;
            _loc_1.stroke = this._ImageEffectsViewSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ImageEffectsViewSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 14079702;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        public function get title() : Label
        {
            return this._110371416title;
        }// end function

        public function set title(param1:Label) : void
        {
            var _loc_2:* = this._110371416title;
            if (_loc_2 !== param1)
            {
                this._110371416title = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ImageEffectsView
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ImageEffectsView) : void
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
