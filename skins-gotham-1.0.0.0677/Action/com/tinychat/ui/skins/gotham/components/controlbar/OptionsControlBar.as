package com.tinychat.ui.skins.gotham.components.controlbar
{
    import com.tinychat.ui.components.controlbar.buttons.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;

    public class OptionsControlBar extends HGroup
    {
        private var _1127080885cameraOptionsButton:CameraOptionsButton;
        private var _1274499728filler:Group;
        private var _183891558microphoneOptionsButton:MicrophoneOptionsButton;
        private var _1917249845settingsButton:SettingsButton;
        private var __moduleFactoryInitialized:Boolean = false;

        public function OptionsControlBar()
        {
            mx_internal::_document = this;
            this.horizontalAlign = "right";
            this.verticalAlign = "justify";
            this.gap = 1;
            this.mxmlContent = [this._OptionsControlBar_Group1_i(), this._OptionsControlBar_CameraOptionsButton1_i(), this._OptionsControlBar_MicrophoneOptionsButton1_i(), this._OptionsControlBar_SettingsButton1_i()];
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

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_5:Number = NaN;
            var _loc_6:UIComponent = null;
            super.updateDisplayList(param1, param2);
            var _loc_3:Array = [this.cameraOptionsButton, this.microphoneOptionsButton, this.settingsButton];
            var _loc_4:Number = 0;
            for each (_loc_6 in _loc_3)
            {
                
                if (_loc_6.visible)
                {
                    _loc_4 = _loc_4 + _loc_6.maxWidth;
                }
            }
            _loc_5 = param1 - _loc_4;
            this.filler.width = Math.max(0, _loc_5);
            return;
        }// end function

        private function _OptionsControlBar_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.mxmlContent = [this._OptionsControlBar_ControlBarFiller1_c()];
            _loc_1.id = "filler";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.filler = _loc_1;
            BindingManager.executeBindings(this, "filler", this.filler);
            return _loc_1;
        }// end function

        private function _OptionsControlBar_ControlBarFiller1_c() : ControlBarFiller
        {
            var _loc_1:* = new ControlBarFiller();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _OptionsControlBar_CameraOptionsButton1_i() : CameraOptionsButton
        {
            var _loc_1:* = new CameraOptionsButton();
            _loc_1.percentWidth = 100;
            _loc_1.maxWidth = 57;
            _loc_1.styleName = "cameraOptionsButton";
            _loc_1.id = "cameraOptionsButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.cameraOptionsButton = _loc_1;
            BindingManager.executeBindings(this, "cameraOptionsButton", this.cameraOptionsButton);
            return _loc_1;
        }// end function

        private function _OptionsControlBar_MicrophoneOptionsButton1_i() : MicrophoneOptionsButton
        {
            var _loc_1:* = new MicrophoneOptionsButton();
            _loc_1.percentWidth = 100;
            _loc_1.maxWidth = 57;
            _loc_1.styleName = "microphoneOptionsButton";
            _loc_1.id = "microphoneOptionsButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.microphoneOptionsButton = _loc_1;
            BindingManager.executeBindings(this, "microphoneOptionsButton", this.microphoneOptionsButton);
            return _loc_1;
        }// end function

        private function _OptionsControlBar_SettingsButton1_i() : SettingsButton
        {
            var _loc_1:* = new SettingsButton();
            _loc_1.percentWidth = 100;
            _loc_1.maxWidth = 57;
            _loc_1.styleName = "settingsButton";
            _loc_1.id = "settingsButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.settingsButton = _loc_1;
            BindingManager.executeBindings(this, "settingsButton", this.settingsButton);
            return _loc_1;
        }// end function

        public function get cameraOptionsButton() : CameraOptionsButton
        {
            return this._1127080885cameraOptionsButton;
        }// end function

        public function set cameraOptionsButton(param1:CameraOptionsButton) : void
        {
            var _loc_2:* = this._1127080885cameraOptionsButton;
            if (_loc_2 !== param1)
            {
                this._1127080885cameraOptionsButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cameraOptionsButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get filler() : Group
        {
            return this._1274499728filler;
        }// end function

        public function set filler(param1:Group) : void
        {
            var _loc_2:* = this._1274499728filler;
            if (_loc_2 !== param1)
            {
                this._1274499728filler = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "filler", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get microphoneOptionsButton() : MicrophoneOptionsButton
        {
            return this._183891558microphoneOptionsButton;
        }// end function

        public function set microphoneOptionsButton(param1:MicrophoneOptionsButton) : void
        {
            var _loc_2:* = this._183891558microphoneOptionsButton;
            if (_loc_2 !== param1)
            {
                this._183891558microphoneOptionsButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "microphoneOptionsButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get settingsButton() : SettingsButton
        {
            return this._1917249845settingsButton;
        }// end function

        public function set settingsButton(param1:SettingsButton) : void
        {
            var _loc_2:* = this._1917249845settingsButton;
            if (_loc_2 !== param1)
            {
                this._1917249845settingsButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "settingsButton", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
