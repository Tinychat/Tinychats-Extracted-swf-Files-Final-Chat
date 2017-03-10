package com.tinychat.ui.skins.gotham.components.spark
{
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class VScrollBarTrackSkin extends Skin implements IStateClient2
    {
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:Button;

        public function VScrollBarTrackSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._VScrollBarTrackSkin_Rect1_c()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"down", overrides:[]}), new State({name:"over", overrides:[]}), new State({name:"disabled", overrides:[]})];
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

        private function _VScrollBarTrackSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.fill = this._VScrollBarTrackSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VScrollBarTrackSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.alpha = 0;
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
