package com.tinychat.ui.skins.gotham.components.video.controls
{
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.filters.*;
    import spark.primitives.*;

    public class VolumeSliderThumbSkin extends Skin implements IStateClient2
    {
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_volume_slider_thumb_png_287409754:Class;
        private var _213507019hostComponent:Button;

        public function VolumeSliderThumbSkin()
        {
            this._embed_mxml__images_volume_slider_thumb_png_287409754 = VolumeSliderThumbSkin__embed_mxml__images_volume_slider_thumb_png_287409754;
            mx_internal::_document = this;
            this.mxmlContent = [this._VolumeSliderThumbSkin_BitmapImage1_c()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[]}), new State({name:"down", overrides:[]}), new State({name:"disabled", overrides:[]})];
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

        private function _VolumeSliderThumbSkin_BitmapImage1_c() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.width = 9;
            _loc_1.height = 9;
            _loc_1.source = this._embed_mxml__images_volume_slider_thumb_png_287409754;
            _loc_1.filters = [this._VolumeSliderThumbSkin_DropShadowFilter1_c()];
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VolumeSliderThumbSkin_DropShadowFilter1_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.angle = 90;
            _loc_1.blurX = 4;
            _loc_1.blurY = 4;
            _loc_1.alpha = 0.5;
            _loc_1.strength = 1;
            _loc_1.distance = 1;
            return _loc_1;
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
