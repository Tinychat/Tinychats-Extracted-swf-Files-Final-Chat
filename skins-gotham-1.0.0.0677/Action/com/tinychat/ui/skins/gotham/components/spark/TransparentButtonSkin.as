package com.tinychat.ui.skins.gotham.components.spark
{
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class TransparentButtonSkin extends Skin implements IStateClient2
    {
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:Button;

        public function TransparentButtonSkin()
        {
            mx_internal::_document = this;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.currentState = "disabled";
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
