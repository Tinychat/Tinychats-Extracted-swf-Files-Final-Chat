package com.tinychat.ui.skins.gotham.components.trial
{
    import com.tinychat.model.utils.effects.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.primitives.*;
    import spark.skins.*;

    public class UpgradeButtonSkin extends SparkSkin implements IBindingClient, IStateClient2
    {
        public var _UpgradeButtonSkin_AnimateColor1:AnimateColor;
        private var _451167753_UpgradeButtonSkin_Transition1:Transition;
        private var _102163ge1:GradientEntry;
        private var _102164ge2:GradientEntry;
        private var _102165ge3:GradientEntry;
        private var _102166ge4:GradientEntry;
        private var _1184053038labelDisplay:Label;
        private var _891980232stroke:SolidColorStroke;
        private var __moduleFactoryInitialized:Boolean = false;
        private var changingColors:RotatingAnimateColor;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:Button;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function UpgradeButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._UpgradeButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_trial_UpgradeButtonSkinWatcherSetupUtil");
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
            this.minWidth = 21;
            this.minHeight = 21;
            this.transitions = [this._UpgradeButtonSkin_Transition1_i()];
            this.mxmlContent = [this._UpgradeButtonSkin_Rect1_c(), this._UpgradeButtonSkin_Rect2_c(), this._UpgradeButtonSkin_Rect3_c(), this._UpgradeButtonSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___UpgradeButtonSkin_SparkSkin1_creationComplete);
            this.addEventListener("addedToStage", this.___UpgradeButtonSkin_SparkSkin1_addedToStage);
            this.addEventListener("removedFromStage", this.___UpgradeButtonSkin_SparkSkin1_removedFromStage);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[new SetProperty().initializeFromObject({target:"_UpgradeButtonSkin_Transition1", name:"autoReverse", value:true}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:9815360}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:5932570}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:12376189}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:5932570}), new SetProperty().initializeFromObject({target:"stroke", name:"color", value:5863446})]}), new State({name:"down", overrides:[new SetProperty().initializeFromObject({target:"ge1", name:"color", value:9744743}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:9749824}), new SetProperty().initializeFromObject({target:"ge3", name:"color", value:9744743}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:9749824}), new SetProperty().initializeFromObject({target:"stroke", name:"color", value:5797653})]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function creationComplete() : void
        {
            this.showHandCursor();
            this.changingColors = new RotatingAnimateColor([this.ge1, this.ge2, this.ge3, this.ge4, this.stroke], 5000, 60, states);
            this.changingColors.play();
            return;
        }// end function

        private function showHandCursor() : void
        {
            this.hostComponent.mouseChildren = false;
            this.hostComponent.useHandCursor = true;
            this.hostComponent.buttonMode = true;
            return;
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            if (this.changingColors)
            {
                this.changingColors.play();
            }
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            if (this.changingColors)
            {
                this.changingColors.stop();
            }
            return;
        }// end function

        private function _UpgradeButtonSkin_Transition1_i() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = false;
            _loc_1.effect = this._UpgradeButtonSkin_AnimateColor1_i();
            this._UpgradeButtonSkin_Transition1 = _loc_1;
            BindingManager.executeBindings(this, "_UpgradeButtonSkin_Transition1", this._UpgradeButtonSkin_Transition1);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 500;
            this._UpgradeButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_UpgradeButtonSkin_AnimateColor1", this._UpgradeButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.fill = this._UpgradeButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._UpgradeButtonSkin_GradientEntry1_i(), this._UpgradeButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 6986015;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5405717;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.topRightRadiusX = 2;
            _loc_1.bottomRightRadiusX = 2;
            _loc_1.stroke = this._UpgradeButtonSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.weight = 1;
            _loc_1.rotation = 90;
            _loc_1.entries = [this._UpgradeButtonSkin_GradientEntry3_i(), this._UpgradeButtonSkin_GradientEntry4_i()];
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_GradientEntry3_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 10469226;
            this.ge3 = _loc_1;
            BindingManager.executeBindings(this, "ge3", this.ge3);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5405717;
            this.ge4 = _loc_1;
            BindingManager.executeBindings(this, "ge4", this.ge4);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.topRightRadiusX = 2;
            _loc_1.bottomRightRadiusX = 2;
            _loc_1.stroke = this._UpgradeButtonSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 5928726;
            _loc_1.weight = 1;
            this.stroke = _loc_1;
            BindingManager.executeBindings(this, "stroke", this.stroke);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.verticalCenter = 1;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.filters = [this._UpgradeButtonSkin_DropShadowFilter1_c()];
            _loc_1.setStyle("paddingLeft", 5);
            _loc_1.setStyle("paddingRight", 5);
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        private function _UpgradeButtonSkin_DropShadowFilter1_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 0;
            _loc_1.alpha = 0.6;
            _loc_1.distance = 1;
            _loc_1.strength = 1;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            _loc_1.angle = 270;
            return _loc_1;
        }// end function

        public function ___UpgradeButtonSkin_SparkSkin1_creationComplete(event:FlexEvent) : void
        {
            this.creationComplete();
            return;
        }// end function

        public function ___UpgradeButtonSkin_SparkSkin1_addedToStage(event:Event) : void
        {
            this.addedToStageHandler(event);
            return;
        }// end function

        public function ___UpgradeButtonSkin_SparkSkin1_removedFromStage(event:Event) : void
        {
            this.removedFromStageHandler(event);
            return;
        }// end function

        private function _UpgradeButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, ge3, ge4, stroke];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_UpgradeButtonSkin_AnimateColor1.targets");
            return result;
        }// end function

        public function get _UpgradeButtonSkin_Transition1() : Transition
        {
            return this._451167753_UpgradeButtonSkin_Transition1;
        }// end function

        public function set _UpgradeButtonSkin_Transition1(param1:Transition) : void
        {
            var _loc_2:* = this._451167753_UpgradeButtonSkin_Transition1;
            if (_loc_2 !== param1)
            {
                this._451167753_UpgradeButtonSkin_Transition1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_UpgradeButtonSkin_Transition1", _loc_2, param1));
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
