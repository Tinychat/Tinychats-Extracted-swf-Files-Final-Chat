package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
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

    public class MicrophoneModeButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _MicrophoneModeButtonSkin_Animate1:Animate;
        public var _MicrophoneModeButtonSkin_Animate2:Animate;
        public var _MicrophoneModeButtonSkin_Animate3:Animate;
        public var _MicrophoneModeButtonSkin_Animate4:Animate;
        public var _MicrophoneModeButtonSkin_Animate5:Animate;
        public var _MicrophoneModeButtonSkin_Animate6:Animate;
        public var _MicrophoneModeButtonSkin_AnimateColor1:AnimateColor;
        public var _MicrophoneModeButtonSkin_AnimateColor2:AnimateColor;
        public var _MicrophoneModeButtonSkin_AnimateColor3:AnimateColor;
        public var _MicrophoneModeButtonSkin_AnimateColor4:AnimateColor;
        public var _MicrophoneModeButtonSkin_AnimateColor5:AnimateColor;
        public var _MicrophoneModeButtonSkin_AnimateColor6:AnimateColor;
        public var _MicrophoneModeButtonSkin_AnimateColor7:AnimateColor;
        public var _MicrophoneModeButtonSkin_AnimateColor8:AnimateColor;
        public var _MicrophoneModeButtonSkin_GlowFilter1:GlowFilter;
        private var _1512024746_MicrophoneModeButtonSkin_Group1:Group;
        private var _376626827_MicrophoneModeButtonSkin_Rect3:Rect;
        public var _MicrophoneModeButtonSkin_VectorImage2:VectorImage;
        private var _102163ge1:GradientEntry;
        private var _102164ge2:GradientEntry;
        private var _102165ge3:GradientEntry;
        private var _102166ge4:GradientEntry;
        private var _1919293257iconDisplay2:VectorImage;
        private var _1184053038labelDisplay:Label;
        private var _903579360shadow:DropShadowFilter;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:IconToggleButton;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function MicrophoneModeButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._MicrophoneModeButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_controlbar_buttons_MicrophoneModeButtonSkinWatcherSetupUtil");
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
            this.transitions = [this._MicrophoneModeButtonSkin_Transition1_c(), this._MicrophoneModeButtonSkin_Transition2_c(), this._MicrophoneModeButtonSkin_Transition3_c(), this._MicrophoneModeButtonSkin_Transition4_c(), this._MicrophoneModeButtonSkin_Transition5_c(), this._MicrophoneModeButtonSkin_Transition6_c(), this._MicrophoneModeButtonSkin_Transition7_c(), this._MicrophoneModeButtonSkin_Transition8_c()];
            this.filters = [];
            this.mxmlContent = [this._MicrophoneModeButtonSkin_Rect1_c(), this._MicrophoneModeButtonSkin_Rect2_c(), this._MicrophoneModeButtonSkin_Rect3_i(), this._MicrophoneModeButtonSkin_Group1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___MicrophoneModeButtonSkin_Skin1_creationComplete);
            var _MicrophoneModeButtonSkin_GlowFilter1_factory:* = new DeferredInstanceFromFunction(this._MicrophoneModeButtonSkin_GlowFilter1_i);
            var _MicrophoneModeButtonSkin_VectorImage2_factory:* = new DeferredInstanceFromFunction(this._MicrophoneModeButtonSkin_VectorImage2_i);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"ge1", name:"color", value:16250871}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:13355979}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:16448250}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:14671839})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new SetProperty().initializeFromObject({target:"shadow", name:"strength", value:0}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:16119285}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:12566463}), new SetProperty().initializeFromObject({target:"_MicrophoneModeButtonSkin_Rect3", name:"bottom", value:1}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:16382457}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:14145495}), new SetProperty().initializeFromObject({target:"_MicrophoneModeButtonSkin_Group1", name:"horizontalCenter", value:1}), new SetProperty().initializeFromObject({target:"_MicrophoneModeButtonSkin_Group1", name:"verticalCenter", value:3})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_MicrophoneModeButtonSkin_VectorImage2_factory, destination:"_MicrophoneModeButtonSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["iconDisplay2"]})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_MicrophoneModeButtonSkin_VectorImage2_factory, destination:"_MicrophoneModeButtonSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["iconDisplay2"]}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:16250871}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:13355979}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:16448250}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:14671839})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_MicrophoneModeButtonSkin_VectorImage2_factory, destination:"_MicrophoneModeButtonSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["iconDisplay2"]}), new SetProperty().initializeFromObject({target:"shadow", name:"strength", value:0}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:16119285}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:12566463}), new SetProperty().initializeFromObject({target:"_MicrophoneModeButtonSkin_Rect3", name:"bottom", value:1}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:16382457}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:14145495}), new SetProperty().initializeFromObject({target:"_MicrophoneModeButtonSkin_Group1", name:"horizontalCenter", value:1}), new SetProperty().initializeFromObject({target:"_MicrophoneModeButtonSkin_Group1", name:"verticalCenter", value:3})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_MicrophoneModeButtonSkin_VectorImage2_factory, destination:"_MicrophoneModeButtonSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["iconDisplay2"]}), new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"pushed", overrides:[new AddItems().initializeFromObject({itemsFactory:_MicrophoneModeButtonSkin_GlowFilter1_factory, destination:null, propertyName:"filters", position:"first"}), new SetProperty().initializeFromObject({target:"shadow", name:"strength", value:0}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:16777215}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:15859142}), new SetProperty().initializeFromObject({target:"_MicrophoneModeButtonSkin_Rect3", name:"bottom", value:1}), new SetStyle().initializeFromObject({target:"iconDisplay2", name:"tintColor", value:7709983})]})];
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

        private function _MicrophoneModeButtonSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "up";
            _loc_1.toState = "over";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._MicrophoneModeButtonSkin_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._MicrophoneModeButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_AnimateColor1", this._MicrophoneModeButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Transition2_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "over";
            _loc_1.toState = "up";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._MicrophoneModeButtonSkin_AnimateColor2_i();
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_AnimateColor2_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 750;
            this._MicrophoneModeButtonSkin_AnimateColor2 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_AnimateColor2", this._MicrophoneModeButtonSkin_AnimateColor2);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Transition3_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "down";
            _loc_1.effect = this._MicrophoneModeButtonSkin_Parallel1_c();
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Parallel1_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 250;
            _loc_1.children = [this._MicrophoneModeButtonSkin_AnimateColor3_i(), this._MicrophoneModeButtonSkin_Animate1_i()];
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_AnimateColor3_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._MicrophoneModeButtonSkin_AnimateColor3 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_AnimateColor3", this._MicrophoneModeButtonSkin_AnimateColor3);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Animate1_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._MicrophoneModeButtonSkin_SimpleMotionPath1_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._MicrophoneModeButtonSkin_Animate1 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_Animate1", this._MicrophoneModeButtonSkin_Animate1);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_SimpleMotionPath1_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Transition4_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "downAndSelected";
            _loc_1.effect = this._MicrophoneModeButtonSkin_Parallel2_c();
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Parallel2_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 250;
            _loc_1.children = [this._MicrophoneModeButtonSkin_AnimateColor4_i(), this._MicrophoneModeButtonSkin_Animate2_i()];
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_AnimateColor4_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._MicrophoneModeButtonSkin_AnimateColor4 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_AnimateColor4", this._MicrophoneModeButtonSkin_AnimateColor4);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Animate2_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._MicrophoneModeButtonSkin_SimpleMotionPath2_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._MicrophoneModeButtonSkin_Animate2 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_Animate2", this._MicrophoneModeButtonSkin_Animate2);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_SimpleMotionPath2_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Transition5_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "pushed";
            _loc_1.effect = this._MicrophoneModeButtonSkin_Parallel3_c();
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Parallel3_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 250;
            _loc_1.children = [this._MicrophoneModeButtonSkin_AnimateColor5_i(), this._MicrophoneModeButtonSkin_Animate3_i()];
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_AnimateColor5_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._MicrophoneModeButtonSkin_AnimateColor5 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_AnimateColor5", this._MicrophoneModeButtonSkin_AnimateColor5);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Animate3_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._MicrophoneModeButtonSkin_SimpleMotionPath3_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._MicrophoneModeButtonSkin_Animate3 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_Animate3", this._MicrophoneModeButtonSkin_Animate3);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_SimpleMotionPath3_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Transition6_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "down";
            _loc_1.toState = "*";
            _loc_1.effect = this._MicrophoneModeButtonSkin_Parallel4_c();
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Parallel4_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 500;
            _loc_1.children = [this._MicrophoneModeButtonSkin_AnimateColor6_i(), this._MicrophoneModeButtonSkin_Animate4_i()];
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_AnimateColor6_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._MicrophoneModeButtonSkin_AnimateColor6 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_AnimateColor6", this._MicrophoneModeButtonSkin_AnimateColor6);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Animate4_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._MicrophoneModeButtonSkin_SimpleMotionPath4_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._MicrophoneModeButtonSkin_Animate4 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_Animate4", this._MicrophoneModeButtonSkin_Animate4);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_SimpleMotionPath4_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Transition7_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "downAndSelected";
            _loc_1.toState = "*";
            _loc_1.effect = this._MicrophoneModeButtonSkin_Parallel5_c();
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Parallel5_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 500;
            _loc_1.children = [this._MicrophoneModeButtonSkin_AnimateColor7_i(), this._MicrophoneModeButtonSkin_Animate5_i()];
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_AnimateColor7_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._MicrophoneModeButtonSkin_AnimateColor7 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_AnimateColor7", this._MicrophoneModeButtonSkin_AnimateColor7);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Animate5_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._MicrophoneModeButtonSkin_SimpleMotionPath5_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._MicrophoneModeButtonSkin_Animate5 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_Animate5", this._MicrophoneModeButtonSkin_Animate5);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_SimpleMotionPath5_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Transition8_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "pushed";
            _loc_1.toState = "*";
            _loc_1.effect = this._MicrophoneModeButtonSkin_Parallel6_c();
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Parallel6_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 500;
            _loc_1.children = [this._MicrophoneModeButtonSkin_AnimateColor8_i(), this._MicrophoneModeButtonSkin_Animate6_i()];
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_AnimateColor8_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._MicrophoneModeButtonSkin_AnimateColor8 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_AnimateColor8", this._MicrophoneModeButtonSkin_AnimateColor8);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Animate6_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._MicrophoneModeButtonSkin_SimpleMotionPath6_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._MicrophoneModeButtonSkin_Animate6 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_Animate6", this._MicrophoneModeButtonSkin_Animate6);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_SimpleMotionPath6_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_GlowFilter1_i() : GlowFilter
        {
            var _loc_1:* = new GlowFilter();
            _loc_1.color = 13101721;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            _loc_1.strength = 7;
            this._MicrophoneModeButtonSkin_GlowFilter1 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_GlowFilter1", this._MicrophoneModeButtonSkin_GlowFilter1);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 1;
            _loc_1.filters = [this._MicrophoneModeButtonSkin_DropShadowFilter1_i()];
            _loc_1.stroke = this._MicrophoneModeButtonSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_DropShadowFilter1_i() : DropShadowFilter
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

        private function _MicrophoneModeButtonSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 10132122;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 2;
            _loc_1.bottom = 1;
            _loc_1.radiusX = 1;
            _loc_1.fill = this._MicrophoneModeButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._MicrophoneModeButtonSkin_GradientEntry1_i(), this._MicrophoneModeButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16119285;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 12566463;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Rect3_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 2;
            _loc_1.radiusX = 1;
            _loc_1.stroke = this._MicrophoneModeButtonSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, "_MicrophoneModeButtonSkin_Rect3");
            this._MicrophoneModeButtonSkin_Rect3 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_Rect3", this._MicrophoneModeButtonSkin_Rect3);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._MicrophoneModeButtonSkin_GradientEntry3_i(), this._MicrophoneModeButtonSkin_GradientEntry4_i()];
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_GradientEntry3_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16382457;
            this.ge3 = _loc_1;
            BindingManager.executeBindings(this, "ge3", this.ge3);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14145495;
            this.ge4 = _loc_1;
            BindingManager.executeBindings(this, "ge4", this.ge4);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 2;
            _loc_1.mxmlContent = [this._MicrophoneModeButtonSkin_VectorImage1_i(), this._MicrophoneModeButtonSkin_Label1_i()];
            _loc_1.id = "_MicrophoneModeButtonSkin_Group1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._MicrophoneModeButtonSkin_Group1 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_Group1", this._MicrophoneModeButtonSkin_Group1);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.left = 5;
            _loc_1.width = 8;
            _loc_1.verticalCenter = -2;
            _loc_1.filters = [this._MicrophoneModeButtonSkin_DropShadowFilter2_c(), this._MicrophoneModeButtonSkin_DropShadowFilter3_c()];
            _loc_1.setStyle("tintColor", 10132122);
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_DropShadowFilter2_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 0;
            _loc_1.alpha = 0.7;
            _loc_1.angle = 90;
            _loc_1.distance = 1;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            _loc_1.inner = true;
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_DropShadowFilter3_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 16777215;
            _loc_1.alpha = 1;
            _loc_1.angle = 90;
            _loc_1.distance = 1;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_VectorImage2_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.left = 10;
            _loc_1.verticalCenter = 2;
            _loc_1.width = 6;
            _loc_1.filters = [this._MicrophoneModeButtonSkin_DropShadowFilter4_c()];
            _loc_1.setStyle("tintColor", 15609406);
            _loc_1.id = "_MicrophoneModeButtonSkin_VectorImage2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._MicrophoneModeButtonSkin_VectorImage2 = _loc_1;
            BindingManager.executeBindings(this, "_MicrophoneModeButtonSkin_VectorImage2", this._MicrophoneModeButtonSkin_VectorImage2);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_DropShadowFilter4_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 0;
            _loc_1.alpha = 0.3;
            _loc_1.angle = 45;
            _loc_1.distance = 1;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 20;
            _loc_1.right = 5;
            _loc_1.verticalCenter = 0;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.filters = [this._MicrophoneModeButtonSkin_DropShadowFilter5_c()];
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        private function _MicrophoneModeButtonSkin_DropShadowFilter5_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 16777215;
            _loc_1.alpha = 1;
            _loc_1.angle = 90;
            _loc_1.distance = 1;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            return _loc_1;
        }// end function

        public function ___MicrophoneModeButtonSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        private function _MicrophoneModeButtonSkin_bindingsSetup() : Array
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
            , null, "_MicrophoneModeButtonSkin_AnimateColor1.targets");
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
            , null, "_MicrophoneModeButtonSkin_AnimateColor2.targets");
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
            , null, "_MicrophoneModeButtonSkin_AnimateColor3.targets");
            result[3] = new Binding(this, null, null, "_MicrophoneModeButtonSkin_Animate1.target", "shadow");
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
            , null, "_MicrophoneModeButtonSkin_AnimateColor4.targets");
            result[5] = new Binding(this, null, null, "_MicrophoneModeButtonSkin_Animate2.target", "shadow");
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
            , null, "_MicrophoneModeButtonSkin_AnimateColor5.targets");
            result[7] = new Binding(this, null, null, "_MicrophoneModeButtonSkin_Animate3.target", "shadow");
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
            , null, "_MicrophoneModeButtonSkin_AnimateColor6.targets");
            result[9] = new Binding(this, null, null, "_MicrophoneModeButtonSkin_Animate4.target", "shadow");
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
            , null, "_MicrophoneModeButtonSkin_AnimateColor7.targets");
            result[11] = new Binding(this, null, null, "_MicrophoneModeButtonSkin_Animate5.target", "shadow");
            result[12] = new Binding(this, function () : Array
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
            , null, "_MicrophoneModeButtonSkin_AnimateColor8.targets");
            result[13] = new Binding(this, null, null, "_MicrophoneModeButtonSkin_Animate6.target", "shadow");
            result[14] = new Binding(this, function () : Object
            {
                return XIcon;
            }// end function
            , null, "_MicrophoneModeButtonSkin_VectorImage2.source");
            return result;
        }// end function

        public function get _MicrophoneModeButtonSkin_Group1() : Group
        {
            return this._1512024746_MicrophoneModeButtonSkin_Group1;
        }// end function

        public function set _MicrophoneModeButtonSkin_Group1(param1:Group) : void
        {
            var _loc_2:* = this._1512024746_MicrophoneModeButtonSkin_Group1;
            if (_loc_2 !== param1)
            {
                this._1512024746_MicrophoneModeButtonSkin_Group1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MicrophoneModeButtonSkin_Group1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _MicrophoneModeButtonSkin_Rect3() : Rect
        {
            return this._376626827_MicrophoneModeButtonSkin_Rect3;
        }// end function

        public function set _MicrophoneModeButtonSkin_Rect3(param1:Rect) : void
        {
            var _loc_2:* = this._376626827_MicrophoneModeButtonSkin_Rect3;
            if (_loc_2 !== param1)
            {
                this._376626827_MicrophoneModeButtonSkin_Rect3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MicrophoneModeButtonSkin_Rect3", _loc_2, param1));
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

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            _watcherSetupUtil = param1;
            return;
        }// end function

    }
}
