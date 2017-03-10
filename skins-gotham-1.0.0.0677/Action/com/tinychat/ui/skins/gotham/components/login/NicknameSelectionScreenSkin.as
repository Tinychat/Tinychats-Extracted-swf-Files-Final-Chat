package com.tinychat.ui.skins.gotham.components.login
{
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.supportClasses.*;

    public class NicknameSelectionScreenSkin extends Skin
    {
        private var _1465299565nicknameSelector:NicknameSelector;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:NicknameSelectionScreen;

        public function NicknameSelectionScreenSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._NicknameSelectionScreenSkin_TitleDisplay1_i(), this._NicknameSelectionScreenSkin_NicknameSelector1_i()];
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

        private function _NicknameSelectionScreenSkin_TitleDisplay1_i() : TitleDisplay
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

        private function _NicknameSelectionScreenSkin_NicknameSelector1_i() : NicknameSelector
        {
            var _loc_1:* = new NicknameSelector();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 65;
            _loc_1.bottom = 15;
            _loc_1.id = "nicknameSelector";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nicknameSelector = _loc_1;
            BindingManager.executeBindings(this, "nicknameSelector", this.nicknameSelector);
            return _loc_1;
        }// end function

        public function get nicknameSelector() : NicknameSelector
        {
            return this._1465299565nicknameSelector;
        }// end function

        public function set nicknameSelector(param1:NicknameSelector) : void
        {
            var _loc_2:* = this._1465299565nicknameSelector;
            if (_loc_2 !== param1)
            {
                this._1465299565nicknameSelector = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nicknameSelector", _loc_2, param1));
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

        public function get hostComponent() : NicknameSelectionScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:NicknameSelectionScreen) : void
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
