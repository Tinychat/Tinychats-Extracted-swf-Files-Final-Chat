package com.tinychat.ui.skins.gotham.components.social.effects
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.primitives.*;
    import spark.skins.*;

    public class EffectsButtonBarButtonSkin extends SparkSkin implements IStateClient2
    {
        private var _756049508_EffectsButtonBarButtonSkin_GradientEntry4:GradientEntry;
        private var _756049509_EffectsButtonBarButtonSkin_GradientEntry5:GradientEntry;
        private var _778982425_EffectsButtonBarButtonSkin_SolidColor1:SolidColor;
        private var _778982424_EffectsButtonBarButtonSkin_SolidColor2:SolidColor;
        private var _778982423_EffectsButtonBarButtonSkin_SolidColor3:SolidColor;
        private var _114985969_EffectsButtonBarButtonSkin_SolidColorStroke1:SolidColorStroke;
        private var _114985968_EffectsButtonBarButtonSkin_SolidColorStroke2:SolidColorStroke;
        private var _904538487borderBottom:Line;
        private var _197416329borderTop:Path;
        private var _3143043fill:Rect;
        private var _681210700highlight:Rect;
        private var _1507289076highlightStroke:Rect;
        private var _1184053038labelDisplay:Label;
        private var _1811511742lowlight:Rect;
        private var _576507650selectedHighlightH1:Rect;
        private var _576507651selectedHighlightH2:Rect;
        private var _397044963selectedHighlightV:Path;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:ButtonBarButton;

        public function EffectsButtonBarButtonSkin()
        {
            mx_internal::_document = this;
            this.minWidth = 21;
            this.minHeight = 28;
            this.mxmlContent = [this._EffectsButtonBarButtonSkin_Rect1_i(), this._EffectsButtonBarButtonSkin_Rect2_i(), this._EffectsButtonBarButtonSkin_Rect3_i(), this._EffectsButtonBarButtonSkin_Path1_i(), this._EffectsButtonBarButtonSkin_Rect5_i(), this._EffectsButtonBarButtonSkin_Rect6_i(), this._EffectsButtonBarButtonSkin_Line1_i(), this._EffectsButtonBarButtonSkin_Path2_i(), this._EffectsButtonBarButtonSkin_Label1_i()];
            this.currentState = "up";
            var _loc_1:* = new DeferredInstanceFromFunction(this._EffectsButtonBarButtonSkin_Rect4_i);
            states = [new State({name:"up", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["highlight"]})]}), new State({name:"over", stateGroups:["overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["highlight"]}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_GradientEntry4", name:"alpha", value:0.22}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_GradientEntry5", name:"alpha", value:0.22})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke1", name:"alpha", value:0.15}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor2", name:"alpha", value:0.25}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor3", name:"alpha", value:0.15}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"alpha", value:0.85})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["highlight"]}), new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["highlight"]}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_GradientEntry4", name:"alpha", value:0.33}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_GradientEntry5", name:"alpha", value:0.33}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke1", name:"alpha", value:1}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor2", name:"alpha", value:0.25}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor3", name:"alpha", value:0.15}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"color", value:16777215}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"alpha", value:1})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["highlight"]}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor1", name:"alpha", value:1}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_GradientEntry4", name:"alpha", value:0.22}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_GradientEntry5", name:"alpha", value:0.22}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke1", name:"alpha", value:0.15}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor2", name:"alpha", value:0.25}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor3", name:"alpha", value:0.15}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"color", value:16777215}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"alpha", value:1})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke1", name:"alpha", value:0.15}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor2", name:"alpha", value:0.25}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor3", name:"alpha", value:0.15}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"color", value:16777215}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"alpha", value:1})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["highlight"]}), new SetProperty().initializeFromObject({name:"alpha", value:0.5}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_GradientEntry4", name:"alpha", value:0.33}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_GradientEntry5", name:"alpha", value:0.33}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke1", name:"alpha", value:1}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor2", name:"alpha", value:0.25}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColor3", name:"alpha", value:0.15}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"color", value:16777215}), new SetProperty().initializeFromObject({target:"_EffectsButtonBarButtonSkin_SolidColorStroke2", name:"alpha", value:1})]})];
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

        private function _EffectsButtonBarButtonSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.topLeftRadiusX = 0;
            _loc_1.topRightRadiusX = 0;
            _loc_1.width = 69;
            _loc_1.height = 28;
            _loc_1.fill = this._EffectsButtonBarButtonSkin_SolidColor1_i();
            _loc_1.initialized(this, "fill");
            this.fill = _loc_1;
            BindingManager.executeBindings(this, "fill", this.fill);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            _loc_1.alpha = 1;
            this._EffectsButtonBarButtonSkin_SolidColor1 = _loc_1;
            BindingManager.executeBindings(this, "_EffectsButtonBarButtonSkin_SolidColor1", this._EffectsButtonBarButtonSkin_SolidColor1);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Rect2_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.topLeftRadiusX = 0;
            _loc_1.topRightRadiusX = 0;
            _loc_1.fill = this._EffectsButtonBarButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, "lowlight");
            this.lowlight = _loc_1;
            BindingManager.executeBindings(this, "lowlight", this.lowlight);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 270;
            _loc_1.entries = [this._EffectsButtonBarButtonSkin_GradientEntry1_c(), this._EffectsButtonBarButtonSkin_GradientEntry2_c(), this._EffectsButtonBarButtonSkin_GradientEntry3_c()];
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 0;
            _loc_1.ratio = 0;
            _loc_1.alpha = 0.0627;
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 0;
            _loc_1.ratio = 0.48;
            _loc_1.alpha = 0.0099;
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_GradientEntry3_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 0;
            _loc_1.ratio = 0.48001;
            _loc_1.alpha = 0;
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Rect3_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.topLeftRadiusX = 0;
            _loc_1.topRightRadiusX = 0;
            _loc_1.initialized(this, "highlight");
            this.highlight = _loc_1;
            BindingManager.executeBindings(this, "highlight", this.highlight);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Rect4_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.topLeftRadiusX = 0;
            _loc_1.topRightRadiusX = 0;
            _loc_1.stroke = this._EffectsButtonBarButtonSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, "highlightStroke");
            this.highlightStroke = _loc_1;
            BindingManager.executeBindings(this, "highlightStroke", this.highlightStroke);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._EffectsButtonBarButtonSkin_GradientEntry4_i(), this._EffectsButtonBarButtonSkin_GradientEntry5_i()];
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            this._EffectsButtonBarButtonSkin_GradientEntry4 = _loc_1;
            BindingManager.executeBindings(this, "_EffectsButtonBarButtonSkin_GradientEntry4", this._EffectsButtonBarButtonSkin_GradientEntry4);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_GradientEntry5_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14211288;
            this._EffectsButtonBarButtonSkin_GradientEntry5 = _loc_1;
            BindingManager.executeBindings(this, "_EffectsButtonBarButtonSkin_GradientEntry5", this._EffectsButtonBarButtonSkin_GradientEntry5);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Path1_i() : Path
        {
            var _loc_1:* = new Path();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.width = 69;
            _loc_1.height = 28;
            _loc_1.stroke = this._EffectsButtonBarButtonSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, "selectedHighlightV");
            this.selectedHighlightV = _loc_1;
            BindingManager.executeBindings(this, "selectedHighlightV", this.selectedHighlightV);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.weight = 1;
            _loc_1.color = 16777215;
            _loc_1.alpha = 0;
            this._EffectsButtonBarButtonSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_EffectsButtonBarButtonSkin_SolidColorStroke1", this._EffectsButtonBarButtonSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Rect5_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.top = 1;
            _loc_1.height = 1;
            _loc_1.fill = this._EffectsButtonBarButtonSkin_SolidColor2_i();
            _loc_1.initialized(this, "selectedHighlightH1");
            this.selectedHighlightH1 = _loc_1;
            BindingManager.executeBindings(this, "selectedHighlightH1", this.selectedHighlightH1);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_SolidColor2_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 14079702;
            _loc_1.alpha = 0;
            this._EffectsButtonBarButtonSkin_SolidColor2 = _loc_1;
            BindingManager.executeBindings(this, "_EffectsButtonBarButtonSkin_SolidColor2", this._EffectsButtonBarButtonSkin_SolidColor2);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Rect6_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.top = 2;
            _loc_1.height = 1;
            _loc_1.fill = this._EffectsButtonBarButtonSkin_SolidColor3_i();
            _loc_1.initialized(this, "selectedHighlightH2");
            this.selectedHighlightH2 = _loc_1;
            BindingManager.executeBindings(this, "selectedHighlightH2", this.selectedHighlightH2);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_SolidColor3_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 14079702;
            _loc_1.alpha = 0;
            this._EffectsButtonBarButtonSkin_SolidColor3 = _loc_1;
            BindingManager.executeBindings(this, "_EffectsButtonBarButtonSkin_SolidColor3", this._EffectsButtonBarButtonSkin_SolidColor3);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Line1_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._EffectsButtonBarButtonSkin_SolidColorStroke2_i();
            _loc_1.initialized(this, "borderBottom");
            this.borderBottom = _loc_1;
            BindingManager.executeBindings(this, "borderBottom", this.borderBottom);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_SolidColorStroke2_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.weight = 1;
            _loc_1.color = 5460819;
            _loc_1.alpha = 0.75;
            this._EffectsButtonBarButtonSkin_SolidColorStroke2 = _loc_1;
            BindingManager.executeBindings(this, "_EffectsButtonBarButtonSkin_SolidColorStroke2", this._EffectsButtonBarButtonSkin_SolidColorStroke2);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Path2_i() : Path
        {
            var _loc_1:* = new Path();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.width = 69;
            _loc_1.height = 28;
            _loc_1.stroke = this._EffectsButtonBarButtonSkin_SolidColorStroke3_c();
            _loc_1.initialized(this, "borderTop");
            this.borderTop = _loc_1;
            BindingManager.executeBindings(this, "borderTop", this.borderTop);
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_SolidColorStroke3_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.weight = 1;
            _loc_1.color = 16711680;
            _loc_1.alpha = 0;
            return _loc_1;
        }// end function

        private function _EffectsButtonBarButtonSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.maxDisplayedLines = 1;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 1;
            _loc_1.left = 10;
            _loc_1.right = 10;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("verticalAlign", "middle");
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        public function get _EffectsButtonBarButtonSkin_GradientEntry4() : GradientEntry
        {
            return this._756049508_EffectsButtonBarButtonSkin_GradientEntry4;
        }// end function

        public function set _EffectsButtonBarButtonSkin_GradientEntry4(param1:GradientEntry) : void
        {
            var _loc_2:* = this._756049508_EffectsButtonBarButtonSkin_GradientEntry4;
            if (_loc_2 !== param1)
            {
                this._756049508_EffectsButtonBarButtonSkin_GradientEntry4 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_EffectsButtonBarButtonSkin_GradientEntry4", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _EffectsButtonBarButtonSkin_GradientEntry5() : GradientEntry
        {
            return this._756049509_EffectsButtonBarButtonSkin_GradientEntry5;
        }// end function

        public function set _EffectsButtonBarButtonSkin_GradientEntry5(param1:GradientEntry) : void
        {
            var _loc_2:* = this._756049509_EffectsButtonBarButtonSkin_GradientEntry5;
            if (_loc_2 !== param1)
            {
                this._756049509_EffectsButtonBarButtonSkin_GradientEntry5 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_EffectsButtonBarButtonSkin_GradientEntry5", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _EffectsButtonBarButtonSkin_SolidColor1() : SolidColor
        {
            return this._778982425_EffectsButtonBarButtonSkin_SolidColor1;
        }// end function

        public function set _EffectsButtonBarButtonSkin_SolidColor1(param1:SolidColor) : void
        {
            var _loc_2:* = this._778982425_EffectsButtonBarButtonSkin_SolidColor1;
            if (_loc_2 !== param1)
            {
                this._778982425_EffectsButtonBarButtonSkin_SolidColor1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_EffectsButtonBarButtonSkin_SolidColor1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _EffectsButtonBarButtonSkin_SolidColor2() : SolidColor
        {
            return this._778982424_EffectsButtonBarButtonSkin_SolidColor2;
        }// end function

        public function set _EffectsButtonBarButtonSkin_SolidColor2(param1:SolidColor) : void
        {
            var _loc_2:* = this._778982424_EffectsButtonBarButtonSkin_SolidColor2;
            if (_loc_2 !== param1)
            {
                this._778982424_EffectsButtonBarButtonSkin_SolidColor2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_EffectsButtonBarButtonSkin_SolidColor2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _EffectsButtonBarButtonSkin_SolidColor3() : SolidColor
        {
            return this._778982423_EffectsButtonBarButtonSkin_SolidColor3;
        }// end function

        public function set _EffectsButtonBarButtonSkin_SolidColor3(param1:SolidColor) : void
        {
            var _loc_2:* = this._778982423_EffectsButtonBarButtonSkin_SolidColor3;
            if (_loc_2 !== param1)
            {
                this._778982423_EffectsButtonBarButtonSkin_SolidColor3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_EffectsButtonBarButtonSkin_SolidColor3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _EffectsButtonBarButtonSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._114985969_EffectsButtonBarButtonSkin_SolidColorStroke1;
        }// end function

        public function set _EffectsButtonBarButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._114985969_EffectsButtonBarButtonSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._114985969_EffectsButtonBarButtonSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_EffectsButtonBarButtonSkin_SolidColorStroke1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _EffectsButtonBarButtonSkin_SolidColorStroke2() : SolidColorStroke
        {
            return this._114985968_EffectsButtonBarButtonSkin_SolidColorStroke2;
        }// end function

        public function set _EffectsButtonBarButtonSkin_SolidColorStroke2(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._114985968_EffectsButtonBarButtonSkin_SolidColorStroke2;
            if (_loc_2 !== param1)
            {
                this._114985968_EffectsButtonBarButtonSkin_SolidColorStroke2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_EffectsButtonBarButtonSkin_SolidColorStroke2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get borderBottom() : Line
        {
            return this._904538487borderBottom;
        }// end function

        public function set borderBottom(param1:Line) : void
        {
            var _loc_2:* = this._904538487borderBottom;
            if (_loc_2 !== param1)
            {
                this._904538487borderBottom = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "borderBottom", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get borderTop() : Path
        {
            return this._197416329borderTop;
        }// end function

        public function set borderTop(param1:Path) : void
        {
            var _loc_2:* = this._197416329borderTop;
            if (_loc_2 !== param1)
            {
                this._197416329borderTop = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "borderTop", _loc_2, param1));
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

        public function get highlight() : Rect
        {
            return this._681210700highlight;
        }// end function

        public function set highlight(param1:Rect) : void
        {
            var _loc_2:* = this._681210700highlight;
            if (_loc_2 !== param1)
            {
                this._681210700highlight = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "highlight", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get highlightStroke() : Rect
        {
            return this._1507289076highlightStroke;
        }// end function

        public function set highlightStroke(param1:Rect) : void
        {
            var _loc_2:* = this._1507289076highlightStroke;
            if (_loc_2 !== param1)
            {
                this._1507289076highlightStroke = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "highlightStroke", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get labelDisplay() : Label
        {
            return this._1184053038labelDisplay;
        }// end function

        public function set labelDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1184053038labelDisplay;
            if (_loc_2 !== param1)
            {
                this._1184053038labelDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get lowlight() : Rect
        {
            return this._1811511742lowlight;
        }// end function

        public function set lowlight(param1:Rect) : void
        {
            var _loc_2:* = this._1811511742lowlight;
            if (_loc_2 !== param1)
            {
                this._1811511742lowlight = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lowlight", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get selectedHighlightH1() : Rect
        {
            return this._576507650selectedHighlightH1;
        }// end function

        public function set selectedHighlightH1(param1:Rect) : void
        {
            var _loc_2:* = this._576507650selectedHighlightH1;
            if (_loc_2 !== param1)
            {
                this._576507650selectedHighlightH1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedHighlightH1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get selectedHighlightH2() : Rect
        {
            return this._576507651selectedHighlightH2;
        }// end function

        public function set selectedHighlightH2(param1:Rect) : void
        {
            var _loc_2:* = this._576507651selectedHighlightH2;
            if (_loc_2 !== param1)
            {
                this._576507651selectedHighlightH2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedHighlightH2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get selectedHighlightV() : Path
        {
            return this._397044963selectedHighlightV;
        }// end function

        public function set selectedHighlightV(param1:Path) : void
        {
            var _loc_2:* = this._397044963selectedHighlightV;
            if (_loc_2 !== param1)
            {
                this._397044963selectedHighlightV = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedHighlightV", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ButtonBarButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ButtonBarButton) : void
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
