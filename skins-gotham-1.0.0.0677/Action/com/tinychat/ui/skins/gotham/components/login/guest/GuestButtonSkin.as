package com.tinychat.ui.skins.gotham.components.login.guest
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.primitives.*;
    import spark.skins.*;

    public class GuestButtonSkin extends SparkSkin implements IStateClient2
    {
        private var _102163ge1:GradientEntry;
        private var _102164ge2:GradientEntry;
        private var _102165ge3:GradientEntry;
        private var _102166ge4:GradientEntry;
        private var _102167ge5:GradientEntry;
        private var _891980232stroke:SolidColorStroke;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_guest_login_png_1733914840:Class;
        private var _213507019hostComponent:ToggleButton;

        public function GuestButtonSkin()
        {
            this._embed_mxml__images_guest_login_png_1733914840 = GuestButtonSkin__embed_mxml__images_guest_login_png_1733914840;
            mx_internal::_document = this;
            this.minWidth = 21;
            this.minHeight = 21;
            this.mxmlContent = [this._GuestButtonSkin_Rect1_c(), this._GuestButtonSkin_Rect2_c(), this._GuestButtonSkin_Rect3_c(), this._GuestButtonSkin_BitmapImage1_c()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___GuestButtonSkin_SparkSkin1_creationComplete);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[]}), new State({name:"down", stateGroups:["downStates"], overrides:[]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[]})];
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

        private function _GuestButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.fill = this._GuestButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._GuestButtonSkin_GradientEntry1_i(), this._GuestButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5735096;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 2774667;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._GuestButtonSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.weight = 1;
            _loc_1.rotation = 90;
            _loc_1.entries = [this._GuestButtonSkin_GradientEntry3_i(), this._GuestButtonSkin_GradientEntry4_i(), this._GuestButtonSkin_GradientEntry5_i()];
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_GradientEntry3_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 8035784;
            _loc_1.ratio = 0;
            this.ge3 = _loc_1;
            BindingManager.executeBindings(this, "ge3", this.ge3);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5735096;
            _loc_1.ratio = 0.1;
            this.ge4 = _loc_1;
            BindingManager.executeBindings(this, "ge4", this.ge4);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_GradientEntry5_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 2774667;
            _loc_1.ratio = 1;
            this.ge5 = _loc_1;
            BindingManager.executeBindings(this, "ge5", this.ge5);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._GuestButtonSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 4743301;
            _loc_1.weight = 1;
            this.stroke = _loc_1;
            BindingManager.executeBindings(this, "stroke", this.stroke);
            return _loc_1;
        }// end function

        private function _GuestButtonSkin_BitmapImage1_c() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.source = this._embed_mxml__images_guest_login_png_1733914840;
            _loc_1.left = 10;
            _loc_1.verticalCenter = 0;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function ___GuestButtonSkin_SparkSkin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        public function get ge1() : GradientEntry
        {
            return this._102163ge1;
        }// end function

        public function set ge1(param1:GradientEntry) : void
        {
            var _loc_2:* = this._102163ge1;
            if (_loc_2 !== param1)
            {
                this._102163ge1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ge1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get ge2() : GradientEntry
        {
            return this._102164ge2;
        }// end function

        public function set ge2(param1:GradientEntry) : void
        {
            var _loc_2:* = this._102164ge2;
            if (_loc_2 !== param1)
            {
                this._102164ge2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ge2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get ge3() : GradientEntry
        {
            return this._102165ge3;
        }// end function

        public function set ge3(param1:GradientEntry) : void
        {
            var _loc_2:* = this._102165ge3;
            if (_loc_2 !== param1)
            {
                this._102165ge3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ge3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get ge4() : GradientEntry
        {
            return this._102166ge4;
        }// end function

        public function set ge4(param1:GradientEntry) : void
        {
            var _loc_2:* = this._102166ge4;
            if (_loc_2 !== param1)
            {
                this._102166ge4 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ge4", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get ge5() : GradientEntry
        {
            return this._102167ge5;
        }// end function

        public function set ge5(param1:GradientEntry) : void
        {
            var _loc_2:* = this._102167ge5;
            if (_loc_2 !== param1)
            {
                this._102167ge5 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ge5", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get stroke() : SolidColorStroke
        {
            return this._891980232stroke;
        }// end function

        public function set stroke(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._891980232stroke;
            if (_loc_2 !== param1)
            {
                this._891980232stroke = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stroke", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ToggleButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ToggleButton) : void
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
