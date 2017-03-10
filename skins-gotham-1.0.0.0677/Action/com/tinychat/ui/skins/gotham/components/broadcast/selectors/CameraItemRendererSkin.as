package com.tinychat.ui.skins.gotham.components.broadcast.selectors
{
    import com.tinychat.ui.components.broadcast.selectors.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
    import com.tinychat.ui.skins.gotham.icons.*;
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

    public class CameraItemRendererSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _CameraItemRendererSkin_AjaxLoader1:AjaxLoader;
        public var _CameraItemRendererSkin_Animate1:Animate;
        public var _CameraItemRendererSkin_AnimateColor1:AnimateColor;
        private var _948131546_CameraItemRendererSkin_Group1:Group;
        public var _CameraItemRendererSkin_Rect3:Rect;
        private var _48165746_CameraItemRendererSkin_SolidColor2:SolidColor;
        public var _CameraItemRendererSkin_VectorImage1:VectorImage;
        private var _1383304148border:SolidColorStroke;
        private var _809612678contentGroup:Group;
        private var _2026595990inactiveTextDisplay:Label;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:CameraItemRenderer;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function CameraItemRendererSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._CameraItemRendererSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_broadcast_selectors_CameraItemRendererSkinWatcherSetupUtil");
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
            this.transitions = [this._CameraItemRendererSkin_Transition1_c(), this._CameraItemRendererSkin_Transition2_c()];
            this.mxmlContent = [this._CameraItemRendererSkin_Rect1_c(), this._CameraItemRendererSkin_Rect2_c(), this._CameraItemRendererSkin_Group1_i(), this._CameraItemRendererSkin_Label2_i()];
            this.currentState = "waiting";
            this.addEventListener("creationComplete", this.___CameraItemRendererSkin_Skin1_creationComplete);
            var _CameraItemRendererSkin_AjaxLoader1_factory:* = new DeferredInstanceFromFunction(this._CameraItemRendererSkin_AjaxLoader1_i);
            var _CameraItemRendererSkin_Label1_factory:* = new DeferredInstanceFromFunction(this._CameraItemRendererSkin_Label1_i);
            var _CameraItemRendererSkin_Rect3_factory:* = new DeferredInstanceFromFunction(this._CameraItemRendererSkin_Rect3_i);
            var _CameraItemRendererSkin_VectorImage1_factory:* = new DeferredInstanceFromFunction(this._CameraItemRendererSkin_VectorImage1_i);
            states = [new State({name:"waiting", overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_AjaxLoader1_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]}), new SetProperty().initializeFromObject({target:"contentGroup", name:"visible", value:false})]}), new State({name:"inactive", overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Label1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_CameraItemRendererSkin_Group1"]}), new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_VectorImage1_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]}), new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"up", overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"over", stateGroups:["overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"_CameraItemRendererSkin_SolidColor2", name:"color", value:5275563})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"border", name:"color", value:9408399}), new SetProperty().initializeFromObject({target:"_CameraItemRendererSkin_SolidColor2", name:"color", value:5209771})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"_CameraItemRendererSkin_SolidColor2", name:"color", value:12434877}), new SetProperty().initializeFromObject({target:"contentGroup", name:"visible", value:false})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"border", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"border", name:"weight", value:2})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"border", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"border", name:"weight", value:2})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"border", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"border", name:"weight", value:2})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_CameraItemRendererSkin_Rect3_factory, destination:"_CameraItemRendererSkin_Group1", propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"border", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"border", name:"weight", value:2})]})];
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

        private function creationCompleteHandler() : void
        {
            this.hostComponent.mouseChildren = false;
            this.hostComponent.useHandCursor = true;
            this.hostComponent.buttonMode = true;
            return;
        }// end function

        private function _CameraItemRendererSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = true;
            _loc_1.effect = this._CameraItemRendererSkin_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._CameraItemRendererSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_CameraItemRendererSkin_AnimateColor1", this._CameraItemRendererSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Transition2_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "selectedStates";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._CameraItemRendererSkin_Animate1_i();
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Animate1_i() : Animate
        {
            var _loc_1:* = new Animate();
            _loc_1.duration = 250;
            this._CameraItemRendererSkin_Animate1 = _loc_1;
            BindingManager.executeBindings(this, "_CameraItemRendererSkin_Animate1", this._CameraItemRendererSkin_Animate1);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 4;
            _loc_1.stroke = this._CameraItemRendererSkin_SolidColorStroke1_i();
            _loc_1.fill = this._CameraItemRendererSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12566463;
            _loc_1.weight = 1;
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.alpha = 0;
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 3;
            _loc_1.right = 3;
            _loc_1.top = 3;
            _loc_1.bottom = 3;
            _loc_1.stroke = this._CameraItemRendererSkin_LinearGradientStroke1_c();
            _loc_1.fill = this._CameraItemRendererSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._CameraItemRendererSkin_GradientEntry1_c(), this._CameraItemRendererSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16316664;
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._CameraItemRendererSkin_GradientEntry3_c(), this._CameraItemRendererSkin_GradientEntry4_c()];
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_GradientEntry3_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15198183;
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_GradientEntry4_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.top = 5;
            _loc_1.width = 115;
            _loc_1.height = 86;
            _loc_1.mxmlContent = [this._CameraItemRendererSkin_Group2_i()];
            _loc_1.id = "_CameraItemRendererSkin_Group1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._CameraItemRendererSkin_Group1 = _loc_1;
            BindingManager.executeBindings(this, "_CameraItemRendererSkin_Group1", this._CameraItemRendererSkin_Group1);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Rect3_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._CameraItemRendererSkin_SolidColor2_i();
            _loc_1.initialized(this, "_CameraItemRendererSkin_Rect3");
            this._CameraItemRendererSkin_Rect3 = _loc_1;
            BindingManager.executeBindings(this, "_CameraItemRendererSkin_Rect3", this._CameraItemRendererSkin_Rect3);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_SolidColor2_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 2514839;
            this._CameraItemRendererSkin_SolidColor2 = _loc_1;
            BindingManager.executeBindings(this, "_CameraItemRendererSkin_SolidColor2", this._CameraItemRendererSkin_SolidColor2);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "contentGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.contentGroup = _loc_1;
            BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_AjaxLoader1_i() : AjaxLoader
        {
            var _loc_1:* = new AjaxLoader();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 10;
            _loc_1.id = "_CameraItemRendererSkin_AjaxLoader1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._CameraItemRendererSkin_AjaxLoader1 = _loc_1;
            BindingManager.executeBindings(this, "_CameraItemRendererSkin_AjaxLoader1", this._CameraItemRendererSkin_AjaxLoader1);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.width = 76;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.alpha = 0.15;
            _loc_1.setStyle("tintColor", 16777215);
            _loc_1.id = "_CameraItemRendererSkin_VectorImage1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._CameraItemRendererSkin_VectorImage1 = _loc_1;
            BindingManager.executeBindings(this, "_CameraItemRendererSkin_VectorImage1", this._CameraItemRendererSkin_VectorImage1);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 10;
            _loc_1.right = 10;
            _loc_1.verticalCenter = -10;
            _loc_1.setStyle("lineBreak", "toFit");
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "inactiveTextDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.inactiveTextDisplay = _loc_1;
            BindingManager.executeBindings(this, "inactiveTextDisplay", this.inactiveTextDisplay);
            return _loc_1;
        }// end function

        private function _CameraItemRendererSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.bottom = 5;
            _loc_1.horizontalCenter = 0;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("paddingTop", 5);
            _loc_1.setStyle("paddingBottom", 5);
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

        public function ___CameraItemRendererSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.creationCompleteHandler();
            return;
        }// end function

        private function _CameraItemRendererSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, null, null, "_CameraItemRendererSkin_AnimateColor1.target", "border");
            result[1] = new Binding(this, null, null, "_CameraItemRendererSkin_Animate1.target", "border");
            result[2] = new Binding(this, function () : Array
            {
                var _loc_1:* = ["weight"];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_CameraItemRendererSkin_Animate1.relevantProperties");
            result[3] = new Binding(this, function () : Object
            {
                return WebcamHiddenIcon;
            }// end function
            , null, "_CameraItemRendererSkin_VectorImage1.source");
            return result;
        }// end function

        public function get _CameraItemRendererSkin_Group1() : Group
        {
            return this._948131546_CameraItemRendererSkin_Group1;
        }// end function

        public function set _CameraItemRendererSkin_Group1(param1:Group) : void
        {
            var _loc_2:* = this._948131546_CameraItemRendererSkin_Group1;
            if (_loc_2 !== param1)
            {
                this._948131546_CameraItemRendererSkin_Group1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_CameraItemRendererSkin_Group1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _CameraItemRendererSkin_SolidColor2() : SolidColor
        {
            return this._48165746_CameraItemRendererSkin_SolidColor2;
        }// end function

        public function set _CameraItemRendererSkin_SolidColor2(param1:SolidColor) : void
        {
            var _loc_2:* = this._48165746_CameraItemRendererSkin_SolidColor2;
            if (_loc_2 !== param1)
            {
                this._48165746_CameraItemRendererSkin_SolidColor2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_CameraItemRendererSkin_SolidColor2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get border() : SolidColorStroke
        {
            return this._1383304148border;
        }// end function

        public function set border(param1:SolidColorStroke) : void
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

        public function get contentGroup() : Group
        {
            return this._809612678contentGroup;
        }// end function

        public function set contentGroup(param1:Group) : void
        {
            var _loc_2:* = this._809612678contentGroup;
            if (_loc_2 !== param1)
            {
                this._809612678contentGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get inactiveTextDisplay() : Label
        {
            return this._2026595990inactiveTextDisplay;
        }// end function

        public function set inactiveTextDisplay(param1:Label) : void
        {
            var _loc_2:* = this._2026595990inactiveTextDisplay;
            if (_loc_2 !== param1)
            {
                this._2026595990inactiveTextDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inactiveTextDisplay", _loc_2, param1));
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

        public function get hostComponent() : CameraItemRenderer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:CameraItemRenderer) : void
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
