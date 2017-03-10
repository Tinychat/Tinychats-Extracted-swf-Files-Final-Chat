package com.tinychat.ui.skins.gotham.components.spark
{
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.primitives.*;

    public class TitleWindowToggleButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _TitleWindowToggleButtonSkin_AnimateColor1:AnimateColor;
        private var _951371639_TitleWindowToggleButtonSkin_Transition1:Transition;
        private var _102163ge1:GradientEntry;
        private var _102164ge2:GradientEntry;
        private var _102165ge3:GradientEntry;
        private var _102166ge4:GradientEntry;
        private var _102167ge5:GradientEntry;
        private var _102168ge6:GradientEntry;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:ToggleButton;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function TitleWindowToggleButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._TitleWindowToggleButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_spark_TitleWindowToggleButtonSkinWatcherSetupUtil");
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
            this.minWidth = 58;
            this.minHeight = 38;
            this.transitions = [this._TitleWindowToggleButtonSkin_Transition1_i()];
            this.mxmlContent = [this._TitleWindowToggleButtonSkin_Rect1_c(), this._TitleWindowToggleButtonSkin_Rect2_c(), this._TitleWindowToggleButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___TitleWindowToggleButtonSkin_Skin1_creationComplete);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"_TitleWindowToggleButtonSkin_Transition1", name:"autoReverse", value:true}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:7382485}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:5278917}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:10143726}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:7513294}), new SetProperty().initializeFromObject({target:"ge5", name:"color", value:8895723}), new SetProperty().initializeFromObject({target:"ge6", name:"color", value:5344708})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new SetProperty().initializeFromObject({target:"ge1", name:"color", value:5016003}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:4030655}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:5870021}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:8368089}), new SetProperty().initializeFromObject({target:"ge5", name:"color", value:4030141}), new SetProperty().initializeFromObject({target:"ge6", name:"color", value:6265808})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"ge1", name:"color", value:7382485}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:5278917}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:10143726}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:7513294}), new SetProperty().initializeFromObject({target:"ge5", name:"color", value:8895723}), new SetProperty().initializeFromObject({target:"ge6", name:"color", value:5344708})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"ge1", name:"color", value:5016003}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:4030655}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:5870021}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:8368089}), new SetProperty().initializeFromObject({target:"ge5", name:"color", value:4030141}), new SetProperty().initializeFromObject({target:"ge6", name:"color", value:6265808})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function _TitleWindowToggleButtonSkin_Transition1_i() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = false;
            _loc_1.effect = this._TitleWindowToggleButtonSkin_AnimateColor1_i();
            this._TitleWindowToggleButtonSkin_Transition1 = _loc_1;
            BindingManager.executeBindings(this, "_TitleWindowToggleButtonSkin_Transition1", this._TitleWindowToggleButtonSkin_Transition1);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 500;
            this._TitleWindowToggleButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_TitleWindowToggleButtonSkin_AnimateColor1", this._TitleWindowToggleButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._TitleWindowToggleButtonSkin_LinearGradientStroke1_c();
            _loc_1.fill = this._TitleWindowToggleButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._TitleWindowToggleButtonSkin_GradientEntry1_i(), this._TitleWindowToggleButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 6330573;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 3768001;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._TitleWindowToggleButtonSkin_GradientEntry3_i(), this._TitleWindowToggleButtonSkin_GradientEntry4_i()];
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_GradientEntry3_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 8500710;
            this.ge3 = _loc_1;
            BindingManager.executeBindings(this, "ge3", this.ge3);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 6396107;
            this.ge4 = _loc_1;
            BindingManager.executeBindings(this, "ge4", this.ge4);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 3;
            _loc_1.bottom = 2;
            _loc_1.fill = this._TitleWindowToggleButtonSkin_LinearGradient2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_LinearGradient2_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._TitleWindowToggleButtonSkin_GradientEntry5_i(), this._TitleWindowToggleButtonSkin_GradientEntry6_i()];
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_GradientEntry5_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 7779050;
            this.ge5 = _loc_1;
            BindingManager.executeBindings(this, "ge5", this.ge5);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_GradientEntry6_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 3899328;
            this.ge6 = _loc_1;
            BindingManager.executeBindings(this, "ge6", this.ge6);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.verticalCenter = 2;
            _loc_1.filters = [this._TitleWindowToggleButtonSkin_DropShadowFilter1_c()];
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("paddingLeft", 15);
            _loc_1.setStyle("paddingRight", 15);
            _loc_1.setStyle("color", 16777215);
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        private function _TitleWindowToggleButtonSkin_DropShadowFilter1_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 0;
            _loc_1.alpha = 0.2;
            _loc_1.distance = 1;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            _loc_1.strength = 1;
            _loc_1.angle = -90;
            return _loc_1;
        }// end function

        public function ___TitleWindowToggleButtonSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        private function _TitleWindowToggleButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4, ge5, ge6];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_TitleWindowToggleButtonSkin_AnimateColor1.targets");
            return result;
        }// end function

        public function get _TitleWindowToggleButtonSkin_Transition1() : Transition
        {
            return this._951371639_TitleWindowToggleButtonSkin_Transition1;
        }// end function

        public function set _TitleWindowToggleButtonSkin_Transition1(param1:Transition) : void
        {
            var _loc_2:* = this._951371639_TitleWindowToggleButtonSkin_Transition1;
            if (_loc_2 !== param1)
            {
                this._951371639_TitleWindowToggleButtonSkin_Transition1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TitleWindowToggleButtonSkin_Transition1", _loc_2, param1));
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

        public function get ge6() : GradientEntry
        {
            return this._102168ge6;
        }// end function

        public function set ge6(param1:GradientEntry) : void
        {
            var _loc_2:* = this._102168ge6;
            if (_loc_2 !== param1)
            {
                this._102168ge6 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ge6", _loc_2, param1));
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
