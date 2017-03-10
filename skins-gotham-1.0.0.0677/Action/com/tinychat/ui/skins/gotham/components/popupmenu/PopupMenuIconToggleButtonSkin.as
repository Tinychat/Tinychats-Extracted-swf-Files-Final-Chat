package com.tinychat.ui.skins.gotham.components.popupmenu
{
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class PopupMenuIconToggleButtonSkin extends Skin implements IStateClient2
    {
        private var _1919293257iconDisplay2:VectorImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:IconToggleButton;

        public function PopupMenuIconToggleButtonSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._PopupMenuIconToggleButtonSkin_Rect1_c(), this._PopupMenuIconToggleButtonSkin_VectorImage1_i()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[]}), new State({name:"down", overrides:[]}), new State({name:"disabled", overrides:[]}), new State({name:"upAndSelected", overrides:[]}), new State({name:"overAndSelected", overrides:[]}), new State({name:"downAndSelected", overrides:[]}), new State({name:"disabledAndSelected", overrides:[]})];
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

        private function _PopupMenuIconToggleButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._PopupMenuIconToggleButtonSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PopupMenuIconToggleButtonSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            _loc_1.alpha = 0;
            return _loc_1;
        }// end function

        private function _PopupMenuIconToggleButtonSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.width = 12;
            _loc_1.verticalCenter = 0;
            _loc_1.setStyle("tintColor", 11449270);
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        public function get iconDisplay2() : VectorImage
        {
            return this._1919293257iconDisplay2;
        }// end function

        public function set iconDisplay2(param1:VectorImage) : void
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

        public function get hostComponent() : IconToggleButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:IconToggleButton) : void
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
