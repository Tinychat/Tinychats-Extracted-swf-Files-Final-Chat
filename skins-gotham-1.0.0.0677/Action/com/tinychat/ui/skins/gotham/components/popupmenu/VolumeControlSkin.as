package com.tinychat.ui.skins.gotham.components.popupmenu
{
    import com.tinychat.ui.components.sound.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class VolumeControlSkin extends Skin implements IStateClient2
    {
        private var _783330987muteButton:MuteButton;
        private var _1698099045volumeSlider:HorizontalVolumeSlider;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:VolumeControl;

        public function VolumeControlSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._VolumeControlSkin_Rect1_c(), this._VolumeControlSkin_MuteButton1_i(), this._VolumeControlSkin_HorizontalVolumeSlider1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[new SetProperty().initializeFromObject({target:"volumeSlider", name:"visible", value:false})]}), new State({name:"over", overrides:[]}), new State({name:"down", overrides:[]})];
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

        private function _VolumeControlSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._VolumeControlSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VolumeControlSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            _loc_1.alpha = 0;
            return _loc_1;
        }// end function

        private function _VolumeControlSkin_MuteButton1_i() : MuteButton
        {
            var _loc_1:* = new MuteButton();
            _loc_1.left = 6;
            _loc_1.width = 12;
            _loc_1.verticalCenter = 0;
            _loc_1.styleName = "muteButton";
            _loc_1.setStyle("skinClass", PopupMenuIconToggleButtonSkin);
            _loc_1.id = "muteButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.muteButton = _loc_1;
            BindingManager.executeBindings(this, "muteButton", this.muteButton);
            return _loc_1;
        }// end function

        private function _VolumeControlSkin_HorizontalVolumeSlider1_i() : HorizontalVolumeSlider
        {
            var _loc_1:* = new HorizontalVolumeSlider();
            _loc_1.left = 22;
            _loc_1.right = 10;
            _loc_1.verticalCenter = 0;
            _loc_1.visible = true;
            _loc_1.id = "volumeSlider";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.volumeSlider = _loc_1;
            BindingManager.executeBindings(this, "volumeSlider", this.volumeSlider);
            return _loc_1;
        }// end function

        public function get muteButton() : MuteButton
        {
            return this._783330987muteButton;
        }// end function

        public function set muteButton(param1:MuteButton) : void
        {
            var _loc_2:* = this._783330987muteButton;
            if (_loc_2 !== param1)
            {
                this._783330987muteButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "muteButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get volumeSlider() : HorizontalVolumeSlider
        {
            return this._1698099045volumeSlider;
        }// end function

        public function set volumeSlider(param1:HorizontalVolumeSlider) : void
        {
            var _loc_2:* = this._1698099045volumeSlider;
            if (_loc_2 !== param1)
            {
                this._1698099045volumeSlider = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "volumeSlider", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : VolumeControl
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:VolumeControl) : void
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
