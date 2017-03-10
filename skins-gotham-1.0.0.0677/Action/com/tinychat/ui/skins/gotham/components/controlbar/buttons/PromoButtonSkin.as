package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.supportClasses.*;

    public class PromoButtonSkin extends Skin implements IStateClient2
    {
        private var _1919293257iconDisplay2:AdvancedBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:LinkButton;

        public function PromoButtonSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._PromoButtonSkin_AdvancedBitmapImage1_i()];
            this.currentState = "disabled";
            this.addEventListener("creationComplete", this.___PromoButtonSkin_Skin1_creationComplete);
            states = [new State({name:"disabled", overrides:[]}), new State({name:"down", overrides:[]}), new State({name:"over", overrides:[]}), new State({name:"up", overrides:[]})];
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

        private function showHandCursor() : void
        {
            this.hostComponent.mouseChildren = false;
            this.hostComponent.useHandCursor = true;
            this.hostComponent.buttonMode = true;
            return;
        }// end function

        private function _PromoButtonSkin_AdvancedBitmapImage1_i() : AdvancedBitmapImage
        {
            var _loc_1:* = new AdvancedBitmapImage();
            _loc_1.initialized(this, "iconDisplay2");
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        public function ___PromoButtonSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        public function get iconDisplay2() : AdvancedBitmapImage
        {
            return this._1919293257iconDisplay2;
        }// end function

        public function set iconDisplay2(param1:AdvancedBitmapImage) : void
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

        public function get hostComponent() : LinkButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:LinkButton) : void
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
