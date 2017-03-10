package com.tinychat.ui.skins.gotham.components.broadcast.selectors
{
    import com.tinychat.ui.components.broadcast.selectors.*;
    import com.tinychat.ui.components.spark.*;
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

    public class VectorIconItemRendererSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _VectorIconItemRendererSkin_Animate1:Animate;
        public var _VectorIconItemRendererSkin_AnimateColor1:AnimateColor;
        private var _346261673_VectorIconItemRendererSkin_SolidColor2:SolidColor;
        private var _1383304148border:SolidColorStroke;
        private var _1919293257iconDisplay2:VectorImage;
        private var _1731902895iconFactory:GothamIconFactory;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:IconItemRenderer;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function VectorIconItemRendererSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._VectorIconItemRendererSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_broadcast_selectors_VectorIconItemRendererSkinWatcherSetupUtil");
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
            this.transitions = [this._VectorIconItemRendererSkin_Transition1_c(), this._VectorIconItemRendererSkin_Transition2_c()];
            this.mxmlContent = [this._VectorIconItemRendererSkin_Rect1_c(), this._VectorIconItemRendererSkin_VGroup1_c()];
            this.currentState = "up";
            this._VectorIconItemRendererSkin_GothamIconFactory1_i();
            this.addEventListener("creationComplete", this.___VectorIconItemRendererSkin_Skin1_creationComplete);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"_VectorIconItemRendererSkin_SolidColor2", name:"color", value:5275563})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new SetProperty().initializeFromObject({target:"border", name:"color", value:9408399}), new SetProperty().initializeFromObject({target:"_VectorIconItemRendererSkin_SolidColor2", name:"color", value:5209771})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new SetProperty().initializeFromObject({target:"_VectorIconItemRendererSkin_SolidColor2", name:"color", value:12434877})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"border", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"border", name:"weight", value:2})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"border", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"border", name:"weight", value:2})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"border", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"border", name:"weight", value:2})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"border", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"border", name:"weight", value:2})]})];
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
            if (this.iconDisplay2.sourceWidth > this.iconDisplay2.sourceHeight)
            {
                this.iconDisplay2.percentWidth = 80;
            }
            else
            {
                this.iconDisplay2.percentHeight = 80;
            }
            return;
        }// end function

        private function _VectorIconItemRendererSkin_GothamIconFactory1_i() : GothamIconFactory
        {
            var _loc_1:* = new GothamIconFactory();
            this.iconFactory = _loc_1;
            BindingManager.executeBindings(this, "iconFactory", this.iconFactory);
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = true;
            _loc_1.effect = this._VectorIconItemRendererSkin_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._VectorIconItemRendererSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_VectorIconItemRendererSkin_AnimateColor1", this._VectorIconItemRendererSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_Transition2_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "selectedStates";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._VectorIconItemRendererSkin_Animate1_i();
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_Animate1_i() : Animate
        {
            var _loc_1:* = new Animate();
            _loc_1.duration = 250;
            this._VectorIconItemRendererSkin_Animate1 = _loc_1;
            BindingManager.executeBindings(this, "_VectorIconItemRendererSkin_Animate1", this._VectorIconItemRendererSkin_Animate1);
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 4;
            _loc_1.stroke = this._VectorIconItemRendererSkin_SolidColorStroke1_i();
            _loc_1.fill = this._VectorIconItemRendererSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12566463;
            _loc_1.weight = 1;
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.alpha = 0;
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 3;
            _loc_1.right = 3;
            _loc_1.top = 3;
            _loc_1.bottom = 3;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._VectorIconItemRendererSkin_Group1_c(), this._VectorIconItemRendererSkin_Label1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.mxmlContent = [this._VectorIconItemRendererSkin_Rect2_c(), this._VectorIconItemRendererSkin_VectorImage1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._VectorIconItemRendererSkin_LinearGradientStroke1_c();
            _loc_1.fill = this._VectorIconItemRendererSkin_SolidColor2_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._VectorIconItemRendererSkin_GradientEntry1_c(), this._VectorIconItemRendererSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16316664;
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_SolidColor2_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 2514839;
            this._VectorIconItemRendererSkin_SolidColor2 = _loc_1;
            BindingManager.executeBindings(this, "_VectorIconItemRendererSkin_SolidColor2", this._VectorIconItemRendererSkin_SolidColor2);
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.setStyle("tintColor", 16777215);
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _VectorIconItemRendererSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
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

        public function ___VectorIconItemRendererSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        private function _VectorIconItemRendererSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, null, null, "_VectorIconItemRendererSkin_AnimateColor1.target", "border");
            result[1] = new Binding(this, null, null, "_VectorIconItemRendererSkin_Animate1.target", "border");
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
            , null, "_VectorIconItemRendererSkin_Animate1.relevantProperties");
            return result;
        }// end function

        public function get _VectorIconItemRendererSkin_SolidColor2() : SolidColor
        {
            return this._346261673_VectorIconItemRendererSkin_SolidColor2;
        }// end function

        public function set _VectorIconItemRendererSkin_SolidColor2(param1:SolidColor) : void
        {
            var _loc_2:* = this._346261673_VectorIconItemRendererSkin_SolidColor2;
            if (_loc_2 !== param1)
            {
                this._346261673_VectorIconItemRendererSkin_SolidColor2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VectorIconItemRendererSkin_SolidColor2", _loc_2, param1));
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

        public function get iconFactory() : GothamIconFactory
        {
            return this._1731902895iconFactory;
        }// end function

        public function set iconFactory(param1:GothamIconFactory) : void
        {
            var _loc_2:* = this._1731902895iconFactory;
            if (_loc_2 !== param1)
            {
                this._1731902895iconFactory = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconFactory", _loc_2, param1));
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

        public function get hostComponent() : IconItemRenderer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:IconItemRenderer) : void
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
