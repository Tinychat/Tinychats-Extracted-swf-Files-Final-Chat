package com.tinychat.ui.skins.gotham.components.video.controls
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class HorizontalVolumeSliderSkin extends Skin implements IStateClient2
    {
        private var _110342614thumb:Button;
        private var _110621003track:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:HSlider;

        public function HorizontalVolumeSliderSkin()
        {
            mx_internal::_document = this;
            this.minWidth = 9;
            this.mxmlContent = [this._HorizontalVolumeSliderSkin_Button1_i(), this._HorizontalVolumeSliderSkin_Button2_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        override protected function measure() : void
        {
            var _loc_1:* = this.thumb.getLayoutBoundsX();
            this.thumb.setLayoutBoundsPosition(0, this.thumb.getLayoutBoundsY());
            super.measure();
            this.thumb.setLayoutBoundsPosition(_loc_1, this.thumb.getLayoutBoundsY());
            return;
        }// end function

        private function _HorizontalVolumeSliderSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.width = 100;
            _loc_1.setStyle("skinClass", VolumeSliderTrackSkin);
            _loc_1.id = "track";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.track = _loc_1;
            BindingManager.executeBindings(this, "track", this.track);
            return _loc_1;
        }// end function

        private function _HorizontalVolumeSliderSkin_Button2_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.width = 9;
            _loc_1.height = 9;
            _loc_1.setStyle("skinClass", VolumeSliderThumbSkin);
            _loc_1.id = "thumb";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.thumb = _loc_1;
            BindingManager.executeBindings(this, "thumb", this.thumb);
            return _loc_1;
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

        public function get hostComponent() : HSlider
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:HSlider) : void
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
