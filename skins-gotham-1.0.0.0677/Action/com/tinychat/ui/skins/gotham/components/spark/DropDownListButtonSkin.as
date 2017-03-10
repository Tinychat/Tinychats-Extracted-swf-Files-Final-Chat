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
    import spark.primitives.*;

    public class DropDownListButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _DropDownListButtonSkin_AnimateColor1:AnimateColor;
        private var _1704044341_DropDownListButtonSkin_Rect1:Rect;
        private var _1704044340_DropDownListButtonSkin_Rect2:Rect;
        private var _93090825arrow:Path;
        private var _102163ge1:GradientEntry;
        private var _102164ge2:GradientEntry;
        private var _102165ge3:GradientEntry;
        private var _102166ge4:GradientEntry;
        private var _891980232stroke:SolidColorStroke;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:Button;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function DropDownListButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._DropDownListButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_spark_DropDownListButtonSkinWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return DropDownListButtonSkin[param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.transitions = [this._DropDownListButtonSkin_Transition1_c()];
            this.mxmlContent = [this._DropDownListButtonSkin_Rect1_i(), this._DropDownListButtonSkin_Rect2_i(), this._DropDownListButtonSkin_Path1_i()];
            this.currentState = "disabled";
            states = [new State({name:"disabled", overrides:[]}), new State({name:"down", overrides:[new SetProperty().initializeFromObject({target:"_DropDownListButtonSkin_Rect1", name:"bottom", value:-2}), new SetProperty().initializeFromObject({target:"_DropDownListButtonSkin_Rect1", name:"bottomLeftRadiusX", value:0}), new SetProperty().initializeFromObject({target:"_DropDownListButtonSkin_Rect1", name:"bottomRightRadiusX", value:0}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:16777215}), new SetProperty().initializeFromObject({target:"_DropDownListButtonSkin_Rect2", name:"bottom", value:-3}), new SetProperty().initializeFromObject({target:"_DropDownListButtonSkin_Rect2", name:"bottomLeftRadiusX", value:0}), new SetProperty().initializeFromObject({target:"_DropDownListButtonSkin_Rect2", name:"bottomRightRadiusX", value:0}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:16777215})]}), new State({name:"over", overrides:[new SetProperty().initializeFromObject({target:"stroke", name:"color", value:13487565}), new SetProperty().initializeFromObject({target:"ge4", name:"color", value:15527148})]}), new State({name:"up", overrides:[]})];
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

        private function _DropDownListButtonSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = true;
            _loc_1.effect = this._DropDownListButtonSkin_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._DropDownListButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_DropDownListButtonSkin_AnimateColor1", this._DropDownListButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.topLeftRadiusX = 2;
            _loc_1.topRightRadiusX = 2;
            _loc_1.bottomLeftRadiusX = 2;
            _loc_1.bottomRightRadiusX = 2;
            _loc_1.stroke = this._DropDownListButtonSkin_SolidColorStroke1_i();
            _loc_1.fill = this._DropDownListButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, "_DropDownListButtonSkin_Rect1");
            this._DropDownListButtonSkin_Rect1 = _loc_1;
            BindingManager.executeBindings(this, "_DropDownListButtonSkin_Rect1", this._DropDownListButtonSkin_Rect1);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            this.stroke = _loc_1;
            BindingManager.executeBindings(this, "stroke", this.stroke);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._DropDownListButtonSkin_GradientEntry1_i(), this._DropDownListButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16250871;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_Rect2_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.topLeftRadiusX = 2;
            _loc_1.topRightRadiusX = 2;
            _loc_1.bottomLeftRadiusX = 2;
            _loc_1.bottomRightRadiusX = 2;
            _loc_1.fill = this._DropDownListButtonSkin_LinearGradient2_c();
            _loc_1.initialized(this, "_DropDownListButtonSkin_Rect2");
            this._DropDownListButtonSkin_Rect2 = _loc_1;
            BindingManager.executeBindings(this, "_DropDownListButtonSkin_Rect2", this._DropDownListButtonSkin_Rect2);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_LinearGradient2_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._DropDownListButtonSkin_GradientEntry3_i(), this._DropDownListButtonSkin_GradientEntry4_i()];
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_GradientEntry3_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            this.ge3 = _loc_1;
            BindingManager.executeBindings(this, "ge3", this.ge3);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15329769;
            this.ge4 = _loc_1;
            BindingManager.executeBindings(this, "ge4", this.ge4);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_Path1_i() : Path
        {
            var _loc_1:* = new Path();
            _loc_1.right = 13;
            _loc_1.verticalCenter = 0;
            _loc_1.data = "M 0 0 l 5 0 l -2.5 3 l -2.5 -3 z";
            _loc_1.fill = this._DropDownListButtonSkin_SolidColor1_c();
            _loc_1.initialized(this, "arrow");
            this.arrow = _loc_1;
            BindingManager.executeBindings(this, "arrow", this.arrow);
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 8553090;
            return _loc_1;
        }// end function

        private function _DropDownListButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [stroke, ge4];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_DropDownListButtonSkin_AnimateColor1.targets");
            return result;
        }// end function

        public function get _DropDownListButtonSkin_Rect1() : Rect
        {
            return this._1704044341_DropDownListButtonSkin_Rect1;
        }// end function

        public function set _DropDownListButtonSkin_Rect1(param1:Rect) : void
        {
            var _loc_2:* = this._1704044341_DropDownListButtonSkin_Rect1;
            if (_loc_2 !== param1)
            {
                this._1704044341_DropDownListButtonSkin_Rect1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_DropDownListButtonSkin_Rect1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _DropDownListButtonSkin_Rect2() : Rect
        {
            return this._1704044340_DropDownListButtonSkin_Rect2;
        }// end function

        public function set _DropDownListButtonSkin_Rect2(param1:Rect) : void
        {
            var _loc_2:* = this._1704044340_DropDownListButtonSkin_Rect2;
            if (_loc_2 !== param1)
            {
                this._1704044340_DropDownListButtonSkin_Rect2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_DropDownListButtonSkin_Rect2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get arrow() : Path
        {
            return this._93090825arrow;
        }// end function

        public function set arrow(param1:Path) : void
        {
            var _loc_2:* = this._93090825arrow;
            if (_loc_2 !== param1)
            {
                this._93090825arrow = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arrow", _loc_2, param1));
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
            DropDownListButtonSkin._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
