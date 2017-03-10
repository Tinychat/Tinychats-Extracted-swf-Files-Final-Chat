package com.tinychat.ui.skins.gotham.components.application
{
    import com.tinychat.ui.components.application.*;
    import com.tinychat.ui.components.preloader.*;
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
    import flash.text.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.supportClasses.*;
    import spark.core.*;

    public class ConnectingScreenSkin extends Skin
    {
        private var _1735090125loadingIndicator:Pupil;
        private var _831827669textDisplay:SpriteVisualElement;
        private var __moduleFactoryInitialized:Boolean = false;
        private var textField:TextField;
        private var _213507019hostComponent:ConnectingScreen;

        public function ConnectingScreenSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._ConnectingScreenSkin_Pupil1_i(), this._ConnectingScreenSkin_SpriteVisualElement1_i()];
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
            super.updateDisplayList(param1, param2);
            if (this.loadingIndicator)
            {
                this.loadingIndicator.x = Math.abs(param1 - this.loadingIndicator.width) / 2;
                this.loadingIndicator.y = Math.abs(param2 - 300) / 2;
            }
            if (this.textDisplay)
            {
            }
            if (!this.textField)
            {
                this.textField = TextFieldFactory.newInstance();
                this.textField.text = "Connecting...";
                this.textDisplay.x = this.loadingIndicator.x + (this.loadingIndicator.width - this.textField.width) / 2;
                this.textDisplay.y = this.loadingIndicator.y + this.loadingIndicator.height + 65;
                this.textDisplay.addChild(this.textField);
            }
            return;
        }// end function

        private function _ConnectingScreenSkin_Pupil1_i() : Pupil
        {
            var _loc_1:* = new Pupil();
            _loc_1.initialized(this, "loadingIndicator");
            this.loadingIndicator = _loc_1;
            BindingManager.executeBindings(this, "loadingIndicator", this.loadingIndicator);
            return _loc_1;
        }// end function

        private function _ConnectingScreenSkin_SpriteVisualElement1_i() : SpriteVisualElement
        {
            var _loc_1:* = new SpriteVisualElement();
            _loc_1.initialized(this, "textDisplay");
            this.textDisplay = _loc_1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return _loc_1;
        }// end function

        public function get loadingIndicator() : Pupil
        {
            return this._1735090125loadingIndicator;
        }// end function

        public function set loadingIndicator(param1:Pupil) : void
        {
            var _loc_2:* = this._1735090125loadingIndicator;
            if (_loc_2 !== param1)
            {
                this._1735090125loadingIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loadingIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get textDisplay() : SpriteVisualElement
        {
            return this._831827669textDisplay;
        }// end function

        public function set textDisplay(param1:SpriteVisualElement) : void
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

        public function get hostComponent() : ConnectingScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ConnectingScreen) : void
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
