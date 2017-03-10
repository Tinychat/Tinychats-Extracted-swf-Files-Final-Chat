package com.tinychat.ui.skins.gotham.components.invite
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.url.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.supportClasses.*;

    public class InviteUrlTextSkin extends Skin
    {
        private var _831827669textDisplay:AdvancedTextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:UrlDisplay;

        public function InviteUrlTextSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._InviteUrlTextSkin_AdvancedTextInput1_i()];
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

        private function _InviteUrlTextSkin_AdvancedTextInput1_i() : AdvancedTextInput
        {
            var _loc_1:* = new AdvancedTextInput();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.setStyle("fontSize", 15);
            _loc_1.id = "textDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.textDisplay = _loc_1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return _loc_1;
        }// end function

        public function get textDisplay() : AdvancedTextInput
        {
            return this._831827669textDisplay;
        }// end function

        public function set textDisplay(param1:AdvancedTextInput) : void
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

        public function get hostComponent() : UrlDisplay
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:UrlDisplay) : void
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
