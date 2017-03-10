package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import com.tinychat.ui.components.spark.*;
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

    public class SnapshotButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _SnapshotButtonSkin_AnimateColor1:AnimateColor;
        private var _1024551981_SnapshotButtonSkin_HGroup1:HGroup;
        private var _1850044401_SnapshotButtonSkin_Transition1:Transition;
        private var _1515786495gradient1:GradientEntry;
        private var _1515786494gradient2:GradientEntry;
        private var _1919293257iconDisplay2:VectorImage;
        private var _1949061436labelDisplay2:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:IconButton;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function SnapshotButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._SnapshotButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_controlbar_buttons_SnapshotButtonSkinWatcherSetupUtil");
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
            this.transitions = [this._SnapshotButtonSkin_Transition1_i()];
            this.mxmlContent = [this._SnapshotButtonSkin_Rect1_c(), this._SnapshotButtonSkin_HGroup1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___SnapshotButtonSkin_Skin1_creationComplete);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[new SetProperty().initializeFromObject({target:"_SnapshotButtonSkin_Transition1", name:"autoReverse", value:true})]}), new State({name:"down", overrides:[new SetProperty().initializeFromObject({target:"gradient1", name:"color", value:15132390}), new SetProperty().initializeFromObject({target:"gradient2", name:"color", value:16645629})]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({target:"_SnapshotButtonSkin_HGroup1", name:"alpha", value:0.5})]})];
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

        private function _SnapshotButtonSkin_Transition1_i() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = false;
            _loc_1.effect = this._SnapshotButtonSkin_AnimateColor1_i();
            this._SnapshotButtonSkin_Transition1 = _loc_1;
            BindingManager.executeBindings(this, "_SnapshotButtonSkin_Transition1", this._SnapshotButtonSkin_Transition1);
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._SnapshotButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_SnapshotButtonSkin_AnimateColor1", this._SnapshotButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._SnapshotButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._SnapshotButtonSkin_GradientEntry1_i(), this._SnapshotButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            this.gradient1 = _loc_1;
            BindingManager.executeBindings(this, "gradient1", this.gradient1);
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14540253;
            this.gradient2 = _loc_1;
            BindingManager.executeBindings(this, "gradient2", this.gradient2);
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_HGroup1_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.horizontalAlign = "center";
            _loc_1.verticalAlign = "middle";
            _loc_1.paddingLeft = 6;
            _loc_1.paddingRight = 6;
            _loc_1.gap = 5;
            _loc_1.mxmlContent = [this._SnapshotButtonSkin_VectorImage1_i(), this._SnapshotButtonSkin_Label1_i()];
            _loc_1.id = "_SnapshotButtonSkin_HGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._SnapshotButtonSkin_HGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_SnapshotButtonSkin_HGroup1", this._SnapshotButtonSkin_HGroup1);
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.filters = [this._SnapshotButtonSkin_DropShadowFilter1_c(), this._SnapshotButtonSkin_DropShadowFilter2_c()];
            _loc_1.setStyle("tintColor", 2987718);
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_DropShadowFilter1_c() : DropShadowFilter
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

        private function _SnapshotButtonSkin_DropShadowFilter2_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 0;
            _loc_1.alpha = 0.75;
            _loc_1.angle = 90;
            _loc_1.distance = 1;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            _loc_1.inner = true;
            return _loc_1;
        }// end function

        private function _SnapshotButtonSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.setStyle("paddingTop", 3);
            _loc_1.id = "labelDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay2", this.labelDisplay2);
            return _loc_1;
        }// end function

        public function ___SnapshotButtonSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        private function _SnapshotButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [gradient1, gradient2];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_SnapshotButtonSkin_AnimateColor1.targets");
            return result;
        }// end function

        public function get _SnapshotButtonSkin_HGroup1() : HGroup
        {
            return this._1024551981_SnapshotButtonSkin_HGroup1;
        }// end function

        public function set _SnapshotButtonSkin_HGroup1(param1:HGroup) : void
        {
            var _loc_2:* = this._1024551981_SnapshotButtonSkin_HGroup1;
            if (_loc_2 !== param1)
            {
                this._1024551981_SnapshotButtonSkin_HGroup1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_SnapshotButtonSkin_HGroup1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _SnapshotButtonSkin_Transition1() : Transition
        {
            return this._1850044401_SnapshotButtonSkin_Transition1;
        }// end function

        public function set _SnapshotButtonSkin_Transition1(param1:Transition) : void
        {
            var _loc_2:* = this._1850044401_SnapshotButtonSkin_Transition1;
            if (_loc_2 !== param1)
            {
                this._1850044401_SnapshotButtonSkin_Transition1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_SnapshotButtonSkin_Transition1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get gradient1() : GradientEntry
        {
            return this._1515786495gradient1;
        }// end function

        public function set gradient1(param1:GradientEntry) : void
        {
            var _loc_2:* = this._1515786495gradient1;
            if (_loc_2 !== param1)
            {
                this._1515786495gradient1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gradient1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get gradient2() : GradientEntry
        {
            return this._1515786494gradient2;
        }// end function

        public function set gradient2(param1:GradientEntry) : void
        {
            var _loc_2:* = this._1515786494gradient2;
            if (_loc_2 !== param1)
            {
                this._1515786494gradient2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gradient2", _loc_2, param1));
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

        public function get labelDisplay2() : Label
        {
            return this._1949061436labelDisplay2;
        }// end function

        public function set labelDisplay2(param1:Label) : void
        {
            var _loc_2:* = this._1949061436labelDisplay2;
            if (_loc_2 !== param1)
            {
                this._1949061436labelDisplay2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelDisplay2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : IconButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:IconButton) : void
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
