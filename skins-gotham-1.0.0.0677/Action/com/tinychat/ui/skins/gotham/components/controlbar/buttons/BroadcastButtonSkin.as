package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.effects.animation.*;
    import spark.filters.*;
    import spark.primitives.*;

    public class BroadcastButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _BroadcastButtonSkin_Animate1:Animate;
        public var _BroadcastButtonSkin_Animate2:Animate;
        public var _BroadcastButtonSkin_Animate3:Animate;
        public var _BroadcastButtonSkin_Animate4:Animate;
        public var _BroadcastButtonSkin_AnimateColor1:AnimateColor;
        public var _BroadcastButtonSkin_AnimateColor2:AnimateColor;
        public var _BroadcastButtonSkin_AnimateColor3:AnimateColor;
        public var _BroadcastButtonSkin_AnimateColor4:AnimateColor;
        public var _BroadcastButtonSkin_AnimateColor5:AnimateColor;
        public var _BroadcastButtonSkin_AnimateColor6:AnimateColor;
        public var _BroadcastButtonSkin_AnimateColor7:AnimateColor;
        public var _BroadcastButtonSkin_AnimateColor8:AnimateColor;
        private var _2031265408_BroadcastButtonSkin_Rect2:Rect;
        private var _2031265407_BroadcastButtonSkin_Rect3:Rect;
        private var _201166059_BroadcastButtonSkin_SolidColor1:SolidColor;
        private var _102163ge1:GradientEntry;
        private var _102164ge2:GradientEntry;
        private var _102165ge3:GradientEntry;
        private var _102166ge4:GradientEntry;
        private var _1184053038labelDisplay:Label;
        private var _903579360shadow:DropShadowFilter;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:ToggleButton;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function BroadcastButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._BroadcastButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_controlbar_buttons_BroadcastButtonSkinWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return [param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.transitions = [this._BroadcastButtonSkin_Transition1_c(), this._BroadcastButtonSkin_Transition2_c(), this._BroadcastButtonSkin_Transition3_c(), this._BroadcastButtonSkin_Transition4_c(), this._BroadcastButtonSkin_Transition5_c(), this._BroadcastButtonSkin_Transition6_c(), this._BroadcastButtonSkin_Transition7_c(), this._BroadcastButtonSkin_Transition8_c()];
            this.mxmlContent = [this._BroadcastButtonSkin_Rect1_c(), this._BroadcastButtonSkin_Rect2_i(), this._BroadcastButtonSkin_Rect3_i(), this._BroadcastButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___BroadcastButtonSkin_Skin1_creationComplete);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_SolidColor1", name:"color", value:43979}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:52213}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:41414}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:4839672}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:3520212})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_SolidColor1", name:"color", value:41414}), new SetProperty().initializeFromObject({target:"shadow", name:"strength", value:0}), new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_Rect2", name:"bottom", value:2}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:50677}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:38335}), new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_Rect3", name:"bottom", value:1}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:3133944}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:8572641}), new SetProperty().initializeFromObject({target:"labelDisplay", name:"horizontalCenter", value:1}), new SetProperty().initializeFromObject({target:"labelDisplay", name:"verticalCenter", value:3})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_SolidColor1", name:"color", value:7566195}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:6513507}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:4868682}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:8092539}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:7434609})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_SolidColor1", name:"color", value:7566195}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:7566195}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:6052956}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:8947848}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:8355711})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_SolidColor1", name:"color", value:7566195}), new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_Rect2", name:"bottom", value:2}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:6513507}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:4868682}), new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_Rect3", name:"bottom", value:1}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:8092539}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:8947848})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5}), new SetProperty().initializeFromObject({target:"_BroadcastButtonSkin_SolidColor1", name:"color", value:7566195}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:6513507}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:4868682}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:8092539}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:7434609})]})];
            var i:uint;
            while (i < bindings.length)
            {
                
                Binding(bindings[i]).execute();
                i = (i + 1);
            }
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

        private function _BroadcastButtonSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "up";
            _loc_1.toState = "over";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._BroadcastButtonSkin_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._BroadcastButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_AnimateColor1", this._BroadcastButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Transition2_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "over";
            _loc_1.toState = "up";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._BroadcastButtonSkin_AnimateColor2_i();
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_AnimateColor2_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 750;
            this._BroadcastButtonSkin_AnimateColor2 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_AnimateColor2", this._BroadcastButtonSkin_AnimateColor2);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Transition3_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "down";
            _loc_1.effect = this._BroadcastButtonSkin_Parallel1_c();
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Parallel1_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 250;
            _loc_1.children = [this._BroadcastButtonSkin_AnimateColor3_i(), this._BroadcastButtonSkin_Animate1_i()];
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_AnimateColor3_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._BroadcastButtonSkin_AnimateColor3 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_AnimateColor3", this._BroadcastButtonSkin_AnimateColor3);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Animate1_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._BroadcastButtonSkin_SimpleMotionPath1_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._BroadcastButtonSkin_Animate1 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_Animate1", this._BroadcastButtonSkin_Animate1);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_SimpleMotionPath1_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Transition4_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "down";
            _loc_1.toState = "*";
            _loc_1.effect = this._BroadcastButtonSkin_Parallel2_c();
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Parallel2_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 500;
            _loc_1.children = [this._BroadcastButtonSkin_AnimateColor4_i(), this._BroadcastButtonSkin_Animate2_i()];
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_AnimateColor4_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._BroadcastButtonSkin_AnimateColor4 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_AnimateColor4", this._BroadcastButtonSkin_AnimateColor4);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Animate2_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._BroadcastButtonSkin_SimpleMotionPath2_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._BroadcastButtonSkin_Animate2 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_Animate2", this._BroadcastButtonSkin_Animate2);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_SimpleMotionPath2_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Transition5_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "upAndSelected";
            _loc_1.toState = "overAndSelected";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._BroadcastButtonSkin_AnimateColor5_i();
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_AnimateColor5_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._BroadcastButtonSkin_AnimateColor5 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_AnimateColor5", this._BroadcastButtonSkin_AnimateColor5);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Transition6_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "overAndSelected";
            _loc_1.toState = "upAndSelected";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._BroadcastButtonSkin_AnimateColor6_i();
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_AnimateColor6_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 750;
            this._BroadcastButtonSkin_AnimateColor6 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_AnimateColor6", this._BroadcastButtonSkin_AnimateColor6);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Transition7_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "downAndSelected";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._BroadcastButtonSkin_Parallel3_c();
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Parallel3_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 150;
            _loc_1.children = [this._BroadcastButtonSkin_AnimateColor7_i(), this._BroadcastButtonSkin_Animate3_i()];
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_AnimateColor7_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._BroadcastButtonSkin_AnimateColor7 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_AnimateColor7", this._BroadcastButtonSkin_AnimateColor7);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Animate3_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._BroadcastButtonSkin_SimpleMotionPath3_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._BroadcastButtonSkin_Animate3 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_Animate3", this._BroadcastButtonSkin_Animate3);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_SimpleMotionPath3_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Transition8_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "downAndSelected";
            _loc_1.toState = "*";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._BroadcastButtonSkin_Parallel4_c();
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Parallel4_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 300;
            _loc_1.children = [this._BroadcastButtonSkin_AnimateColor8_i(), this._BroadcastButtonSkin_Animate4_i()];
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_AnimateColor8_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._BroadcastButtonSkin_AnimateColor8 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_AnimateColor8", this._BroadcastButtonSkin_AnimateColor8);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Animate4_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._BroadcastButtonSkin_SimpleMotionPath4_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._BroadcastButtonSkin_Animate4 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_Animate4", this._BroadcastButtonSkin_Animate4);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_SimpleMotionPath4_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.fill = this._BroadcastButtonSkin_SolidColor1_i();
            _loc_1.filters = [this._BroadcastButtonSkin_DropShadowFilter1_i()];
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 41159;
            this._BroadcastButtonSkin_SolidColor1 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_SolidColor1", this._BroadcastButtonSkin_SolidColor1);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_DropShadowFilter1_i() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.alpha = 0.5;
            _loc_1.blurX = 0;
            _loc_1.blurY = 0;
            _loc_1.distance = 1;
            _loc_1.strength = 1;
            this.shadow = _loc_1;
            BindingManager.executeBindings(this, "shadow", this.shadow);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Rect2_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 3;
            _loc_1.radiusX = 1;
            _loc_1.fill = this._BroadcastButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, "_BroadcastButtonSkin_Rect2");
            this._BroadcastButtonSkin_Rect2 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_Rect2", this._BroadcastButtonSkin_Rect2);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._BroadcastButtonSkin_GradientEntry1_i(), this._BroadcastButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 50676;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 38592;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Rect3_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 2;
            _loc_1.radiusX = 1;
            _loc_1.stroke = this._BroadcastButtonSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, "_BroadcastButtonSkin_Rect3");
            this._BroadcastButtonSkin_Rect3 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastButtonSkin_Rect3", this._BroadcastButtonSkin_Rect3);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._BroadcastButtonSkin_GradientEntry3_i(), this._BroadcastButtonSkin_GradientEntry4_i()];
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_GradientEntry3_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 3068921;
            this.ge3 = _loc_1;
            BindingManager.executeBindings(this, "ge3", this.ge3);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 1355471;
            this.ge4 = _loc_1;
            BindingManager.executeBindings(this, "ge4", this.ge4);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 2;
            _loc_1.filters = [this._BroadcastButtonSkin_DropShadowFilter2_c()];
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        private function _BroadcastButtonSkin_DropShadowFilter2_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 0;
            _loc_1.alpha = 0.4;
            _loc_1.angle = -90;
            _loc_1.distance = 1;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            return _loc_1;
        }// end function

        public function ___BroadcastButtonSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        private function _BroadcastButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_BroadcastButtonSkin_AnimateColor1.targets");
            result[1] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_BroadcastButtonSkin_AnimateColor2.targets");
            result[2] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_BroadcastButtonSkin_AnimateColor3.targets");
            result[3] = new Binding(this, null, null, "_BroadcastButtonSkin_Animate1.target", "shadow");
            result[4] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_BroadcastButtonSkin_AnimateColor4.targets");
            result[5] = new Binding(this, null, null, "_BroadcastButtonSkin_Animate2.target", "shadow");
            result[6] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_BroadcastButtonSkin_AnimateColor5.targets");
            result[7] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_BroadcastButtonSkin_AnimateColor6.targets");
            result[8] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_BroadcastButtonSkin_AnimateColor7.targets");
            result[9] = new Binding(this, null, null, "_BroadcastButtonSkin_Animate3.target", "shadow");
            result[10] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_BroadcastButtonSkin_AnimateColor8.targets");
            result[11] = new Binding(this, null, null, "_BroadcastButtonSkin_Animate4.target", "shadow");
            return result;
        }// end function

        public function get _BroadcastButtonSkin_Rect2() : Rect
        {
            return this._2031265408_BroadcastButtonSkin_Rect2;
        }// end function

        public function set _BroadcastButtonSkin_Rect2(param1:Rect) : void
        {
            var _loc_2:* = this._2031265408_BroadcastButtonSkin_Rect2;
            if (_loc_2 !== param1)
            {
                this._2031265408_BroadcastButtonSkin_Rect2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BroadcastButtonSkin_Rect2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _BroadcastButtonSkin_Rect3() : Rect
        {
            return this._2031265407_BroadcastButtonSkin_Rect3;
        }// end function

        public function set _BroadcastButtonSkin_Rect3(param1:Rect) : void
        {
            var _loc_2:* = this._2031265407_BroadcastButtonSkin_Rect3;
            if (_loc_2 !== param1)
            {
                this._2031265407_BroadcastButtonSkin_Rect3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BroadcastButtonSkin_Rect3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _BroadcastButtonSkin_SolidColor1() : SolidColor
        {
            return this._201166059_BroadcastButtonSkin_SolidColor1;
        }// end function

        public function set _BroadcastButtonSkin_SolidColor1(param1:SolidColor) : void
        {
            var _loc_2:* = this._201166059_BroadcastButtonSkin_SolidColor1;
            if (_loc_2 !== param1)
            {
                this._201166059_BroadcastButtonSkin_SolidColor1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BroadcastButtonSkin_SolidColor1", _loc_2, param1));
                }
            }
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

        public function get shadow() : DropShadowFilter
        {
            return this._903579360shadow;
        }// end function

        public function set shadow(param1:DropShadowFilter) : void
        {
            var _loc_2:* = this._903579360shadow;
            if (_loc_2 !== param1)
            {
                this._903579360shadow = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shadow", _loc_2, param1));
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

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            _watcherSetupUtil = param1;
            return;
        }// end function

    }
}
