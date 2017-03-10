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

    public class RouletteButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _RouletteButtonSkin_Animate1:Animate;
        public var _RouletteButtonSkin_Animate2:Animate;
        public var _RouletteButtonSkin_AnimateColor1:AnimateColor;
        public var _RouletteButtonSkin_AnimateColor2:AnimateColor;
        public var _RouletteButtonSkin_AnimateColor3:AnimateColor;
        public var _RouletteButtonSkin_AnimateColor4:AnimateColor;
        private var _1431268562_RouletteButtonSkin_Rect3:Rect;
        private var _558900196_RouletteButtonSkin_SolidColorStroke1:SolidColorStroke;
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
        private var _213507019hostComponent:Button;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function RouletteButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._RouletteButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_controlbar_buttons_RouletteButtonSkinWatcherSetupUtil");
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
            this.transitions = [this._RouletteButtonSkin_Transition1_c(), this._RouletteButtonSkin_Transition2_c(), this._RouletteButtonSkin_Transition3_c(), this._RouletteButtonSkin_Transition4_c()];
            this.mxmlContent = [this._RouletteButtonSkin_Rect1_c(), this._RouletteButtonSkin_Rect2_c(), this._RouletteButtonSkin_Rect3_i(), this._RouletteButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___RouletteButtonSkin_Skin1_creationComplete);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[new SetProperty().initializeFromObject({target:"_RouletteButtonSkin_SolidColorStroke1", name:"color", value:8658616}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:12802036}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:10628326}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:14060796}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:12867835})]}), new State({name:"down", overrides:[new SetProperty().initializeFromObject({target:"shadow", name:"strength", value:0}), new SetProperty().initializeFromObject({target:"_RouletteButtonSkin_SolidColorStroke1", name:"color", value:5182062}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:12535797}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:10163433}), new SetProperty().initializeFromObject({target:"_RouletteButtonSkin_Rect3", name:"bottom", value:1}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:13664505}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:14060796}), new SetProperty().initializeFromObject({target:"labelDisplay", name:"horizontalCenter", value:1}), new SetProperty().initializeFromObject({target:"labelDisplay", name:"verticalCenter", value:3})]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function _RouletteButtonSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "up";
            _loc_1.toState = "over";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._RouletteButtonSkin_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._RouletteButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_RouletteButtonSkin_AnimateColor1", this._RouletteButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Transition2_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "over";
            _loc_1.toState = "up";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._RouletteButtonSkin_AnimateColor2_i();
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_AnimateColor2_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 750;
            this._RouletteButtonSkin_AnimateColor2 = _loc_1;
            BindingManager.executeBindings(this, "_RouletteButtonSkin_AnimateColor2", this._RouletteButtonSkin_AnimateColor2);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Transition3_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "down";
            _loc_1.effect = this._RouletteButtonSkin_Parallel1_c();
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Parallel1_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 250;
            _loc_1.children = [this._RouletteButtonSkin_AnimateColor3_i(), this._RouletteButtonSkin_Animate1_i()];
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_AnimateColor3_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._RouletteButtonSkin_AnimateColor3 = _loc_1;
            BindingManager.executeBindings(this, "_RouletteButtonSkin_AnimateColor3", this._RouletteButtonSkin_AnimateColor3);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Animate1_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._RouletteButtonSkin_SimpleMotionPath1_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._RouletteButtonSkin_Animate1 = _loc_1;
            BindingManager.executeBindings(this, "_RouletteButtonSkin_Animate1", this._RouletteButtonSkin_Animate1);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_SimpleMotionPath1_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Transition4_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "down";
            _loc_1.toState = "*";
            _loc_1.effect = this._RouletteButtonSkin_Parallel2_c();
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Parallel2_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 500;
            _loc_1.children = [this._RouletteButtonSkin_AnimateColor4_i(), this._RouletteButtonSkin_Animate2_i()];
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_AnimateColor4_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            this._RouletteButtonSkin_AnimateColor4 = _loc_1;
            BindingManager.executeBindings(this, "_RouletteButtonSkin_AnimateColor4", this._RouletteButtonSkin_AnimateColor4);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Animate2_i() : Animate
        {
            var _loc_1:* = new Animate();
            new Vector.<MotionPath>(1)[0] = this._RouletteButtonSkin_SimpleMotionPath2_c();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this._RouletteButtonSkin_Animate2 = _loc_1;
            BindingManager.executeBindings(this, "_RouletteButtonSkin_Animate2", this._RouletteButtonSkin_Animate2);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_SimpleMotionPath2_c() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "strength";
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 1;
            _loc_1.filters = [this._RouletteButtonSkin_DropShadowFilter1_i()];
            _loc_1.stroke = this._RouletteButtonSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_DropShadowFilter1_i() : DropShadowFilter
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

        private function _RouletteButtonSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 5182062;
            _loc_1.weight = 1;
            this._RouletteButtonSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_RouletteButtonSkin_SolidColorStroke1", this._RouletteButtonSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 2;
            _loc_1.bottom = 1;
            _loc_1.radiusX = 1;
            _loc_1.fill = this._RouletteButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._RouletteButtonSkin_GradientEntry1_i(), this._RouletteButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 12535797;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 10163433;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Rect3_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 2;
            _loc_1.radiusX = 1;
            _loc_1.stroke = this._RouletteButtonSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, "_RouletteButtonSkin_Rect3");
            this._RouletteButtonSkin_Rect3 = _loc_1;
            BindingManager.executeBindings(this, "_RouletteButtonSkin_Rect3", this._RouletteButtonSkin_Rect3);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._RouletteButtonSkin_GradientEntry3_i(), this._RouletteButtonSkin_GradientEntry4_i()];
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_GradientEntry3_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 13664505;
            this.ge3 = _loc_1;
            BindingManager.executeBindings(this, "ge3", this.ge3);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 12015346;
            this.ge4 = _loc_1;
            BindingManager.executeBindings(this, "ge4", this.ge4);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 2;
            _loc_1.filters = [this._RouletteButtonSkin_DropShadowFilter2_c()];
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        private function _RouletteButtonSkin_DropShadowFilter2_c() : DropShadowFilter
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

        public function ___RouletteButtonSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        private function _RouletteButtonSkin_bindingsSetup() : Array
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
            , null, "_RouletteButtonSkin_AnimateColor1.targets");
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
            , null, "_RouletteButtonSkin_AnimateColor2.targets");
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
            , null, "_RouletteButtonSkin_AnimateColor3.targets");
            result[3] = new Binding(this, null, null, "_RouletteButtonSkin_Animate1.target", "shadow");
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
            , null, "_RouletteButtonSkin_AnimateColor4.targets");
            result[5] = new Binding(this, null, null, "_RouletteButtonSkin_Animate2.target", "shadow");
            return result;
        }// end function

        public function get _RouletteButtonSkin_Rect3() : Rect
        {
            return this._1431268562_RouletteButtonSkin_Rect3;
        }// end function

        public function set _RouletteButtonSkin_Rect3(param1:Rect) : void
        {
            var _loc_2:* = this._1431268562_RouletteButtonSkin_Rect3;
            if (_loc_2 !== param1)
            {
                this._1431268562_RouletteButtonSkin_Rect3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_RouletteButtonSkin_Rect3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _RouletteButtonSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._558900196_RouletteButtonSkin_SolidColorStroke1;
        }// end function

        public function set _RouletteButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._558900196_RouletteButtonSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._558900196_RouletteButtonSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_RouletteButtonSkin_SolidColorStroke1", _loc_2, param1));
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

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            _watcherSetupUtil = param1;
            return;
        }// end function

    }
}
