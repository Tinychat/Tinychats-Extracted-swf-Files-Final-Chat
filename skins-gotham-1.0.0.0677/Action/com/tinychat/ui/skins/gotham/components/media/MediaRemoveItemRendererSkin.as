package com.tinychat.ui.skins.gotham.components.media
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class MediaRemoveItemRendererSkin extends Skin implements IStateClient2
    {
        private var _1919293257iconDisplay2:BitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_icons_remove_item_png_814097449:Class;
        private var _213507019hostComponent:Button;

        public function MediaRemoveItemRendererSkin()
        {
            this._embed_mxml__images_icons_remove_item_png_814097449 = MediaRemoveItemRendererSkin__embed_mxml__images_icons_remove_item_png_814097449;
            mx_internal::_document = this;
            this.mxmlContent = [this._MediaRemoveItemRendererSkin_Rect1_c(), this._MediaRemoveItemRendererSkin_BitmapImage1_i()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[new SetProperty().initializeFromObject({target:"iconDisplay2", name:"alpha", value:0.7})]}), new State({name:"down", overrides:[]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function _MediaRemoveItemRendererSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._MediaRemoveItemRendererSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _MediaRemoveItemRendererSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.alpha = 0;
            _loc_1.color = 255;
            return _loc_1;
        }// end function

        private function _MediaRemoveItemRendererSkin_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.width = 18;
            _loc_1.height = 16;
            _loc_1.source = this._embed_mxml__images_icons_remove_item_png_814097449;
            _loc_1.initialized(this, "iconDisplay2");
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        public function get iconDisplay2() : BitmapImage
        {
            return this._1919293257iconDisplay2;
        }// end function

        public function set iconDisplay2(param1:BitmapImage) : void
        {
            var _loc_2:* = this._1919293257iconDisplay2;
            if (_loc_2 !== param1)
            {
                this._1919293257iconDisplay2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconDisplay2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : Button
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:Button) : void
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
