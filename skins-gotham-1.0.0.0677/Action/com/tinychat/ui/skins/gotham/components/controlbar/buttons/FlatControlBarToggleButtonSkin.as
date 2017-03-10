package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import com.tinychat.ui.components.spark.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.primitives.*;

    public class FlatControlBarToggleButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _FlatControlBarToggleButtonSkin_AnimateColor1:AnimateColor;
        private var _756008818_FlatControlBarToggleButtonSkin_Transition1:Transition;
        private var _1515786495gradient1:GradientEntry;
        private var _1515786494gradient2:GradientEntry;
        private var _1919293257iconDisplay2:VectorImage;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:IconToggleButton;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function FlatControlBarToggleButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._FlatControlBarToggleButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_controlbar_buttons_FlatControlBarToggleButtonSkinWatcherSetupUtil");
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
            this.transitions = [this._FlatControlBarToggleButtonSkin_Transition1_i()];
            this.mxmlContent = [this._FlatControlBarToggleButtonSkin_Rect1_c(), this._FlatControlBarToggleButtonSkin_VectorImage1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___FlatControlBarToggleButtonSkin_Skin1_creationComplete);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"_FlatControlBarToggleButtonSkin_Transition1", name:"autoReverse", value:true})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new SetProperty().initializeFromObject({target:"gradient1", name:"color", value:15132390}), new SetProperty().initializeFromObject({target:"gradient2", name:"color", value:16645629})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new SetProperty().initializeFromObject({target:"iconDisplay2", name:"alpha", value:0.5})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"gradient1", name:"color", value:15132390}), new SetProperty().initializeFromObject({target:"gradient2", name:"color", value:16645629})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[]})];
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

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            if (getStyle("iconHorizontalCenter") != undefined)
            {
                this.iconDisplay2.horizontalCenter = getStyle("iconHorizontalCenter");
            }
            else
            {
                this.iconDisplay2.horizontalCenter = 0;
            }
            if (getStyle("iconVerticalCenter") != undefined)
            {
                this.iconDisplay2.verticalCenter = getStyle("iconVerticalCenter");
            }
            else
            {
                this.iconDisplay2.verticalCenter = 1;
            }
            return;
        }// end function

        private function _FlatControlBarToggleButtonSkin_Transition1_i() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = false;
            _loc_1.effect = this._FlatControlBarToggleButtonSkin_AnimateColor1_i();
            this._FlatControlBarToggleButtonSkin_Transition1 = _loc_1;
            BindingManager.executeBindings(this, "_FlatControlBarToggleButtonSkin_Transition1", this._FlatControlBarToggleButtonSkin_Transition1);
            return _loc_1;
        }// end function

        private function _FlatControlBarToggleButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._FlatControlBarToggleButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_FlatControlBarToggleButtonSkin_AnimateColor1", this._FlatControlBarToggleButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _FlatControlBarToggleButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._FlatControlBarToggleButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _FlatControlBarToggleButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._FlatControlBarToggleButtonSkin_GradientEntry1_i(), this._FlatControlBarToggleButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _FlatControlBarToggleButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            this.gradient1 = _loc_1;
            BindingManager.executeBindings(this, "gradient1", this.gradient1);
            return _loc_1;
        }// end function

        private function _FlatControlBarToggleButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14540253;
            this.gradient2 = _loc_1;
            BindingManager.executeBindings(this, "gradient2", this.gradient2);
            return _loc_1;
        }// end function

        private function _FlatControlBarToggleButtonSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.filters = [this._FlatControlBarToggleButtonSkin_DropShadowFilter1_c()];
            _loc_1.setStyle("tintColor", 4868682);
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _FlatControlBarToggleButtonSkin_DropShadowFilter1_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 16777215;
            _loc_1.alpha = 1;
            _loc_1.angle = 90;
            _loc_1.distance = 2;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            return _loc_1;
        }// end function

        public function ___FlatControlBarToggleButtonSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        private function _FlatControlBarToggleButtonSkin_bindingsSetup() : Array
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
            , null, "_FlatControlBarToggleButtonSkin_AnimateColor1.targets");
            return result;
        }// end function

        public function get _FlatControlBarToggleButtonSkin_Transition1() : Transition
        {
            return this._756008818_FlatControlBarToggleButtonSkin_Transition1;
        }// end function

        public function set _FlatControlBarToggleButtonSkin_Transition1(param1:Transition) : void
        {
            var _loc_2:* = this._756008818_FlatControlBarToggleButtonSkin_Transition1;
            if (_loc_2 !== param1)
            {
                this._756008818_FlatControlBarToggleButtonSkin_Transition1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_FlatControlBarToggleButtonSkin_Transition1", _loc_2, param1));
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
