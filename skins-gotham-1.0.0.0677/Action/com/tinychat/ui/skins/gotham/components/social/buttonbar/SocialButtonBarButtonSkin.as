package com.tinychat.ui.skins.gotham.components.social.buttonbar
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
    import spark.primitives.*;

    public class SocialButtonBarButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _SocialButtonBarButtonSkin_AnimateColor1:AnimateColor;
        public var _SocialButtonBarButtonSkin_Fade1:Fade;
        public var _SocialButtonBarButtonSkin_Rect1:Rect;
        private var _1025025151_SocialButtonBarButtonSkin_Transition1:Transition;
        private var _1515786495gradient1:GradientEntry;
        private var _1515786494gradient2:GradientEntry;
        private var _1919293257iconDisplay2:AdvancedBitmapImage;
        private var _102977213line1:SolidColorStroke;
        private var _102977214line2:SolidColorStroke;
        private var _102977215line3:SolidColorStroke;
        private var _102977216line4:SolidColorStroke;
        private var _627206627selectionIndicator:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:IconButtonBarButton;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function SocialButtonBarButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._SocialButtonBarButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_social_buttonbar_SocialButtonBarButtonSkinWatcherSetupUtil");
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
            this.width = 42;
            this.transitions = [this._SocialButtonBarButtonSkin_Transition1_i(), this._SocialButtonBarButtonSkin_Transition2_c()];
            this.mxmlContent = [this._SocialButtonBarButtonSkin_Rect1_i(), this._SocialButtonBarButtonSkin_AdvancedBitmapImage1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___SocialButtonBarButtonSkin_Skin1_creationComplete);
            var _SocialButtonBarButtonSkin_Group1_factory:* = new DeferredInstanceFromFunction(this._SocialButtonBarButtonSkin_Group1_i);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_SocialButtonBarButtonSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_SocialButtonBarButtonSkin_Rect1"]}), new SetProperty().initializeFromObject({target:"_SocialButtonBarButtonSkin_Transition1", name:"autoReverse", value:true})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_SocialButtonBarButtonSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_SocialButtonBarButtonSkin_Rect1"]}), new SetProperty().initializeFromObject({target:"gradient1", name:"color", value:15132390}), new SetProperty().initializeFromObject({target:"gradient2", name:"color", value:16645629}), new SetProperty().initializeFromObject({target:"line1", name:"color", value:14013909})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_SocialButtonBarButtonSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_SocialButtonBarButtonSkin_Rect1"]}), new SetProperty().initializeFromObject({target:"line2", name:"color", value:5612003}), new SetProperty().initializeFromObject({target:"line3", name:"color", value:5613029}), new SetProperty().initializeFromObject({target:"line4", name:"color", value:7650554})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_SocialButtonBarButtonSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_SocialButtonBarButtonSkin_Rect1"]}), new SetProperty().initializeFromObject({target:"line2", name:"color", value:5612003}), new SetProperty().initializeFromObject({target:"line3", name:"color", value:5613029}), new SetProperty().initializeFromObject({target:"line4", name:"color", value:7650554})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_SocialButtonBarButtonSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_SocialButtonBarButtonSkin_Rect1"]}), new SetProperty().initializeFromObject({target:"gradient1", name:"color", value:15132390}), new SetProperty().initializeFromObject({target:"gradient2", name:"color", value:16645629}), new SetProperty().initializeFromObject({target:"line2", name:"color", value:5612003}), new SetProperty().initializeFromObject({target:"line3", name:"color", value:5613029}), new SetProperty().initializeFromObject({target:"line4", name:"color", value:7650554})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_SocialButtonBarButtonSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_SocialButtonBarButtonSkin_Rect1"]}), new SetProperty().initializeFromObject({target:"line2", name:"color", value:5612003}), new SetProperty().initializeFromObject({target:"line3", name:"color", value:5613029}), new SetProperty().initializeFromObject({target:"line4", name:"color", value:7650554})]})];
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

        private function _SocialButtonBarButtonSkin_Transition1_i() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = false;
            _loc_1.effect = this._SocialButtonBarButtonSkin_AnimateColor1_i();
            this._SocialButtonBarButtonSkin_Transition1 = _loc_1;
            BindingManager.executeBindings(this, "_SocialButtonBarButtonSkin_Transition1", this._SocialButtonBarButtonSkin_Transition1);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._SocialButtonBarButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_SocialButtonBarButtonSkin_AnimateColor1", this._SocialButtonBarButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_Transition2_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "up";
            _loc_1.toState = "*";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._SocialButtonBarButtonSkin_Fade1_i();
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_Fade1_i() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.duration = 250;
            this._SocialButtonBarButtonSkin_Fade1 = _loc_1;
            BindingManager.executeBindings(this, "_SocialButtonBarButtonSkin_Fade1", this._SocialButtonBarButtonSkin_Fade1);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._SocialButtonBarButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, "_SocialButtonBarButtonSkin_Rect1");
            this._SocialButtonBarButtonSkin_Rect1 = _loc_1;
            BindingManager.executeBindings(this, "_SocialButtonBarButtonSkin_Rect1", this._SocialButtonBarButtonSkin_Rect1);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._SocialButtonBarButtonSkin_GradientEntry1_i(), this._SocialButtonBarButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            this.gradient1 = _loc_1;
            BindingManager.executeBindings(this, "gradient1", this.gradient1);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14540253;
            this.gradient2 = _loc_1;
            BindingManager.executeBindings(this, "gradient2", this.gradient2);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.bottom = 0;
            _loc_1.mxmlContent = [this._SocialButtonBarButtonSkin_Line1_c(), this._SocialButtonBarButtonSkin_Line2_c(), this._SocialButtonBarButtonSkin_Line3_c(), this._SocialButtonBarButtonSkin_Line4_c()];
            _loc_1.id = "selectionIndicator";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.selectionIndicator = _loc_1;
            BindingManager.executeBindings(this, "selectionIndicator", this.selectionIndicator);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.stroke = this._SocialButtonBarButtonSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            this.line1 = _loc_1;
            BindingManager.executeBindings(this, "line1", this.line1);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_Line2_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 1;
            _loc_1.stroke = this._SocialButtonBarButtonSkin_SolidColorStroke2_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_SolidColorStroke2_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12369084;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            this.line2 = _loc_1;
            BindingManager.executeBindings(this, "line2", this.line2);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_Line3_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 2;
            _loc_1.stroke = this._SocialButtonBarButtonSkin_SolidColorStroke3_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_SolidColorStroke3_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12434877;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            this.line3 = _loc_1;
            BindingManager.executeBindings(this, "line3", this.line3);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_Line4_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 3;
            _loc_1.stroke = this._SocialButtonBarButtonSkin_SolidColorStroke4_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_SolidColorStroke4_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13948116;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            this.line4 = _loc_1;
            BindingManager.executeBindings(this, "line4", this.line4);
            return _loc_1;
        }// end function

        private function _SocialButtonBarButtonSkin_AdvancedBitmapImage1_i() : AdvancedBitmapImage
        {
            var _loc_1:* = new AdvancedBitmapImage();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.initialized(this, "iconDisplay2");
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        public function ___SocialButtonBarButtonSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.showHandCursor();
            return;
        }// end function

        private function _SocialButtonBarButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [line1, line2, line3, line4, gradient1, gradient2];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_SocialButtonBarButtonSkin_AnimateColor1.targets");
            result[1] = new Binding(this, null, null, "_SocialButtonBarButtonSkin_Fade1.target", "selectionIndicator");
            return result;
        }// end function

        public function get _SocialButtonBarButtonSkin_Transition1() : Transition
        {
            return this._1025025151_SocialButtonBarButtonSkin_Transition1;
        }// end function

        public function set _SocialButtonBarButtonSkin_Transition1(param1:Transition) : void
        {
            var _loc_2:* = this._1025025151_SocialButtonBarButtonSkin_Transition1;
            if (_loc_2 !== param1)
            {
                this._1025025151_SocialButtonBarButtonSkin_Transition1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_SocialButtonBarButtonSkin_Transition1", _loc_2, param1));
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

        public function get iconDisplay2() : AdvancedBitmapImage
        {
            return this._1919293257iconDisplay2;
        }// end function

        public function set iconDisplay2(param1:AdvancedBitmapImage) : void
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

        public function get line1() : SolidColorStroke
        {
            return this._102977213line1;
        }// end function

        public function set line1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._102977213line1;
            if (_loc_2 !== param1)
            {
                this._102977213line1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "line1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get line2() : SolidColorStroke
        {
            return this._102977214line2;
        }// end function

        public function set line2(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._102977214line2;
            if (_loc_2 !== param1)
            {
                this._102977214line2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "line2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get line3() : SolidColorStroke
        {
            return this._102977215line3;
        }// end function

        public function set line3(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._102977215line3;
            if (_loc_2 !== param1)
            {
                this._102977215line3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "line3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get line4() : SolidColorStroke
        {
            return this._102977216line4;
        }// end function

        public function set line4(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._102977216line4;
            if (_loc_2 !== param1)
            {
                this._102977216line4 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "line4", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get selectionIndicator() : Group
        {
            return this._627206627selectionIndicator;
        }// end function

        public function set selectionIndicator(param1:Group) : void
        {
            var _loc_2:* = this._627206627selectionIndicator;
            if (_loc_2 !== param1)
            {
                this._627206627selectionIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectionIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : IconButtonBarButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:IconButtonBarButton) : void
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
