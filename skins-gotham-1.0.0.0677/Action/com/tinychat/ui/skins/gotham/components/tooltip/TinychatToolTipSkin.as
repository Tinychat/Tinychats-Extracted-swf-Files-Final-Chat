package com.tinychat.ui.skins.gotham.components.tooltip
{
    import com.tinychat.ui.components.tooltip.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.managers.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.primitives.*;

    public class TinychatToolTipSkin extends Skin implements IStateClient2
    {
        private var _1596981023_TinychatToolTipSkin_TinychatToolTipSkin_definition01:TinychatToolTipSkin_definition0;
        private var _1596981022_TinychatToolTipSkin_TinychatToolTipSkin_definition02:TinychatToolTipSkin_definition0;
        private var _1596980992_TinychatToolTipSkin_TinychatToolTipSkin_definition11:TinychatToolTipSkin_definition1;
        private var _1596980991_TinychatToolTipSkin_TinychatToolTipSkin_definition12:TinychatToolTipSkin_definition1;
        private var _1383304148border:Group;
        private var _3143043fill:Rect;
        private var _729286897fillMask:Group;
        private var _831827669textDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TinychatToolTip;
        private static var initEffects:Boolean = init();

        public function TinychatToolTipSkin()
        {
            mx_internal::_document = this;
            this.filters = [this._TinychatToolTipSkin_DropShadowFilter1_c()];
            this.mxmlContent = [this._TinychatToolTipSkin_Group1_i(), this._TinychatToolTipSkin_Group2_i(), this._TinychatToolTipSkin_Rect1_i(), this._TinychatToolTipSkin_Label1_i()];
            this.currentState = "topLeft";
            states = [new State({name:"topLeft", stateGroups:["leftStates", "topStates"], overrides:[new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"right", value:15}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"bottom", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"rotation", value:180}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition11", name:"bottom", value:4}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"right", value:15}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"bottom", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"rotation", value:180}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition12", name:"bottom", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingTop", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingBottom", value:6})]}), new State({name:"topCenter", stateGroups:["topStates", "centerStates"], overrides:[new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"horizontalCenter", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"bottom", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"rotation", value:180}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition11", name:"bottom", value:4}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"horizontalCenter", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"bottom", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"rotation", value:180}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition12", name:"bottom", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingTop", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingBottom", value:6})]}), new State({name:"topRight", stateGroups:["rightStates", "topStates"], overrides:[new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"left", value:16}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"bottom", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"rotation", value:180}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition11", name:"bottom", value:4}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"left", value:15}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"bottom", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"rotation", value:180}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition12", name:"bottom", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingTop", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingBottom", value:6})]}), new State({name:"bottomLeft", stateGroups:["leftStates", "bottomStates"], overrides:[new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"right", value:15}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"top", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"rotation", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition11", name:"top", value:4}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"right", value:15}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"top", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"rotation", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition12", name:"top", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingTop", value:10}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingBottom", value:2})]}), new State({name:"bottomCenter", stateGroups:["centerStates", "bottomStates"], overrides:[new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"horizontalCenter", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"top", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"rotation", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition11", name:"top", value:4}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"horizontalCenter", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"top", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"rotation", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition12", name:"top", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingTop", value:10}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingBottom", value:2})]}), new State({name:"bottomRight", stateGroups:["rightStates", "bottomStates"], overrides:[new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"left", value:16}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"top", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition01", name:"rotation", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition11", name:"top", value:4}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"left", value:15}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"top", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition02", name:"rotation", value:0}), new SetProperty().initializeFromObject({target:"_TinychatToolTipSkin_TinychatToolTipSkin_definition12", name:"top", value:4}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingTop", value:10}), new SetStyle().initializeFromObject({target:"textDisplay", name:"paddingBottom", value:2})]})];
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

        override protected function initializationComplete() : void
        {
            this.textDisplay.maxWidth = this.hostComponent.maxWidth;
            this.fill.mask = this.fillMask;
            super.initializationComplete();
            return;
        }// end function

        private function _TinychatToolTipSkin_DropShadowFilter1_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 0;
            _loc_1.angle = 90;
            _loc_1.alpha = 0.5;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            _loc_1.distance = 0.5;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.mxmlContent = [this._TinychatToolTipSkin_TinychatToolTipSkin_definition01_i(), this._TinychatToolTipSkin_TinychatToolTipSkin_definition11_i()];
            _loc_1.id = "border";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_TinychatToolTipSkin_definition01_i() : TinychatToolTipSkin_definition0
        {
            var _loc_1:* = new TinychatToolTipSkin_definition0();
            _loc_1.fill = this._TinychatToolTipSkin_SolidColor1_c();
            _loc_1.stroke = this._TinychatToolTipSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition01");
            this._TinychatToolTipSkin_TinychatToolTipSkin_definition01 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition01", this._TinychatToolTipSkin_TinychatToolTipSkin_definition01);
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 12632256;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12632256;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_TinychatToolTipSkin_definition11_i() : TinychatToolTipSkin_definition1
        {
            var _loc_1:* = new TinychatToolTipSkin_definition1();
            _loc_1.fill = this._TinychatToolTipSkin_SolidColor2_c();
            _loc_1.stroke = this._TinychatToolTipSkin_SolidColorStroke2_c();
            _loc_1.initialized(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition11");
            this._TinychatToolTipSkin_TinychatToolTipSkin_definition11 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition11", this._TinychatToolTipSkin_TinychatToolTipSkin_definition11);
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_SolidColor2_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 12632256;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_SolidColorStroke2_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12632256;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.mxmlContent = [this._TinychatToolTipSkin_TinychatToolTipSkin_definition02_i(), this._TinychatToolTipSkin_TinychatToolTipSkin_definition12_i()];
            _loc_1.id = "fillMask";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.fillMask = _loc_1;
            BindingManager.executeBindings(this, "fillMask", this.fillMask);
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_TinychatToolTipSkin_definition02_i() : TinychatToolTipSkin_definition0
        {
            var _loc_1:* = new TinychatToolTipSkin_definition0();
            _loc_1.initialized(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition02");
            this._TinychatToolTipSkin_TinychatToolTipSkin_definition02 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition02", this._TinychatToolTipSkin_TinychatToolTipSkin_definition02);
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_TinychatToolTipSkin_definition12_i() : TinychatToolTipSkin_definition1
        {
            var _loc_1:* = new TinychatToolTipSkin_definition1();
            _loc_1.initialized(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition12");
            this._TinychatToolTipSkin_TinychatToolTipSkin_definition12 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition12", this._TinychatToolTipSkin_TinychatToolTipSkin_definition12);
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._TinychatToolTipSkin_LinearGradient1_c();
            _loc_1.initialized(this, "fill");
            this.fill = _loc_1;
            BindingManager.executeBindings(this, "fill", this.fill);
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._TinychatToolTipSkin_GradientEntry1_c(), this._TinychatToolTipSkin_GradientEntry2_c(), this._TinychatToolTipSkin_GradientEntry3_c(), this._TinychatToolTipSkin_GradientEntry4_c(), this._TinychatToolTipSkin_GradientEntry5_c()];
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0.3;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_GradientEntry3_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16055293;
            _loc_1.ratio = 0.6;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_GradientEntry4_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15792636;
            _loc_1.ratio = 0.61;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_GradientEntry5_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14610677;
            _loc_1.ratio = 1;
            return _loc_1;
        }// end function

        private function _TinychatToolTipSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("paddingLeft", 6);
            _loc_1.setStyle("paddingRight", 6);
            _loc_1.setStyle("lineBreak", "toFit");
            _loc_1.id = "textDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.textDisplay = _loc_1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return _loc_1;
        }// end function

        public function get _TinychatToolTipSkin_TinychatToolTipSkin_definition01() : TinychatToolTipSkin_definition0
        {
            return this._1596981023_TinychatToolTipSkin_TinychatToolTipSkin_definition01;
        }// end function

        public function set _TinychatToolTipSkin_TinychatToolTipSkin_definition01(param1:TinychatToolTipSkin_definition0) : void
        {
            var _loc_2:* = this._1596981023_TinychatToolTipSkin_TinychatToolTipSkin_definition01;
            if (_loc_2 !== param1)
            {
                this._1596981023_TinychatToolTipSkin_TinychatToolTipSkin_definition01 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition01", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _TinychatToolTipSkin_TinychatToolTipSkin_definition02() : TinychatToolTipSkin_definition0
        {
            return this._1596981022_TinychatToolTipSkin_TinychatToolTipSkin_definition02;
        }// end function

        public function set _TinychatToolTipSkin_TinychatToolTipSkin_definition02(param1:TinychatToolTipSkin_definition0) : void
        {
            var _loc_2:* = this._1596981022_TinychatToolTipSkin_TinychatToolTipSkin_definition02;
            if (_loc_2 !== param1)
            {
                this._1596981022_TinychatToolTipSkin_TinychatToolTipSkin_definition02 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition02", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _TinychatToolTipSkin_TinychatToolTipSkin_definition11() : TinychatToolTipSkin_definition1
        {
            return this._1596980992_TinychatToolTipSkin_TinychatToolTipSkin_definition11;
        }// end function

        public function set _TinychatToolTipSkin_TinychatToolTipSkin_definition11(param1:TinychatToolTipSkin_definition1) : void
        {
            var _loc_2:* = this._1596980992_TinychatToolTipSkin_TinychatToolTipSkin_definition11;
            if (_loc_2 !== param1)
            {
                this._1596980992_TinychatToolTipSkin_TinychatToolTipSkin_definition11 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition11", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _TinychatToolTipSkin_TinychatToolTipSkin_definition12() : TinychatToolTipSkin_definition1
        {
            return this._1596980991_TinychatToolTipSkin_TinychatToolTipSkin_definition12;
        }// end function

        public function set _TinychatToolTipSkin_TinychatToolTipSkin_definition12(param1:TinychatToolTipSkin_definition1) : void
        {
            var _loc_2:* = this._1596980991_TinychatToolTipSkin_TinychatToolTipSkin_definition12;
            if (_loc_2 !== param1)
            {
                this._1596980991_TinychatToolTipSkin_TinychatToolTipSkin_definition12 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TinychatToolTipSkin_TinychatToolTipSkin_definition12", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get border() : Group
        {
            return this._1383304148border;
        }// end function

        public function set border(param1:Group) : void
        {
            var _loc_2:* = this._1383304148border;
            if (_loc_2 !== param1)
            {
                this._1383304148border = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "border", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get fill() : Rect
        {
            return this._3143043fill;
        }// end function

        public function set fill(param1:Rect) : void
        {
            var _loc_2:* = this._3143043fill;
            if (_loc_2 !== param1)
            {
                this._3143043fill = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fill", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get fillMask() : Group
        {
            return this._729286897fillMask;
        }// end function

        public function set fillMask(param1:Group) : void
        {
            var _loc_2:* = this._729286897fillMask;
            if (_loc_2 !== param1)
            {
                this._729286897fillMask = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fillMask", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get textDisplay() : Label
        {
            return this._831827669textDisplay;
        }// end function

        public function set textDisplay(param1:Label) : void
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

        public function get hostComponent() : TinychatToolTip
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TinychatToolTip) : void
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

        private static function init() : Boolean
        {
            var _loc_1:* = new Fade();
            var _loc_2:* = new Fade();
            _loc_1.alphaFrom = 0;
            _loc_1.alphaTo = 1;
            _loc_1.duration = 250;
            _loc_2.alphaFrom = 1;
            _loc_2.alphaTo = 0;
            _loc_2.duration = 250;
            ToolTipManager.showEffect = _loc_1;
            ToolTipManager.hideEffect = _loc_2;
            return true;
        }// end function

    }
}
