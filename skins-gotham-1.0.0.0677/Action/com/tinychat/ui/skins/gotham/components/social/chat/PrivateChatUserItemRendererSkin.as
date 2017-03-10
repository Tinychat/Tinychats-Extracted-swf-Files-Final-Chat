package com.tinychat.ui.skins.gotham.components.social.chat
{
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.conversation.facebook.*;
    import com.tinychat.model.social.chat.conversation.mqtt.*;
    import com.tinychat.ui.components.social.chat.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.core.*;
    import spark.effects.*;
    import spark.primitives.*;

    public class PrivateChatUserItemRendererSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _PrivateChatUserItemRendererSkin_AnimateColor1:AnimateColor;
        private var _94756344close:Button;
        private var _809612678contentGroup:HGroup;
        private var _3143043fill:SolidColor;
        private var _1919293257iconDisplay2:VectorImage;
        private var _1844466615nameDisplay:NameDisplay;
        private var _4222434popupOverlayDisplay:ClassFactory;
        private var _891980232stroke:SolidColorStroke;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:PrivateChatUserItemRenderer;
        private static var facebookIcon:SpriteVisualElement;
        private static var mqttIcon:SpriteVisualElement;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function PrivateChatUserItemRendererSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._PrivateChatUserItemRendererSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_social_chat_PrivateChatUserItemRendererSkinWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return PrivateChatUserItemRendererSkin[param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.maxWidth = 105;
            this.height = 21;
            this.maxHeight = 21;
            this.transitions = [this._PrivateChatUserItemRendererSkin_Transition1_c()];
            this.mxmlContent = [this._PrivateChatUserItemRendererSkin_Rect1_c(), this._PrivateChatUserItemRendererSkin_HGroup1_i()];
            this.currentState = "unreadMessages";
            this._PrivateChatUserItemRendererSkin_ClassFactory1_i();
            this.addEventListener("initialize", this.___PrivateChatUserItemRendererSkin_Skin1_initialize);
            states = [new State({name:"unreadMessages", overrides:[new SetProperty().initializeFromObject({target:"stroke", name:"color", value:15326882}), new SetProperty().initializeFromObject({target:"fill", name:"color", value:16709075})]}), new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"fill", name:"color", value:16317951})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new SetProperty().initializeFromObject({target:"fill", name:"color", value:16317951})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"stroke", name:"color", value:12377580}), new SetProperty().initializeFromObject({target:"fill", name:"color", value:13889790})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"stroke", name:"color", value:12377580}), new SetProperty().initializeFromObject({target:"fill", name:"color", value:13889790})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"stroke", name:"color", value:12377580}), new SetProperty().initializeFromObject({target:"fill", name:"color", value:13889790})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"stroke", name:"color", value:12377580})]})];
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

        public function messageCountDisplayAddedToStageHandler(param1:Label) : void
        {
            if (this.contentGroup.getElementIndex(param1) != 1)
            {
                this.contentGroup.setElementIndex(param1, 1);
            }
            return;
        }// end function

        private function initializeHandler(event:FlexEvent) : void
        {
            this.hostComponent.addEventListener(Event.CHANGE, this.changeHandler);
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            var _loc_3:* = undefined;
            var _loc_2:* = this.hostComponent.data as AbstractUserConversation;
            if (this.iconDisplay2)
            {
                if (_loc_2 is FacebookUserConversation)
                {
                    if (!facebookIcon)
                    {
                        facebookIcon = new FacebookSquareLogo();
                    }
                    _loc_3 = facebookIcon;
                }
                else if (_loc_2 is MqttUserConversation)
                {
                    if (!mqttIcon)
                    {
                        mqttIcon = new TinychatEyeIcon();
                    }
                    _loc_3 = mqttIcon;
                }
                this.iconDisplay2.source = _loc_3;
                this.iconDisplay2.includeInLayout = _loc_3 != null;
            }
            return;
        }// end function

        private function _PrivateChatUserItemRendererSkin_ClassFactory1_i() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = PrivateChatUserItemRendererSkinInnerClass0;
            _loc_1.properties = {outerDocument:this};
            this.popupOverlayDisplay = _loc_1;
            BindingManager.executeBindings(this, "popupOverlayDisplay", this.popupOverlayDisplay);
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = true;
            _loc_1.effect = this._PrivateChatUserItemRendererSkin_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._PrivateChatUserItemRendererSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_PrivateChatUserItemRendererSkin_AnimateColor1", this._PrivateChatUserItemRendererSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._PrivateChatUserItemRendererSkin_SolidColorStroke1_i();
            _loc_1.fill = this._PrivateChatUserItemRendererSkin_SolidColor1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13691122;
            _loc_1.weight = 1;
            this.stroke = _loc_1;
            BindingManager.executeBindings(this, "stroke", this.stroke);
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 15727359;
            this.fill = _loc_1;
            BindingManager.executeBindings(this, "fill", this.fill);
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_HGroup1_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.gap = 2;
            _loc_1.verticalCenter = 0;
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._PrivateChatUserItemRendererSkin_VectorImage1_i(), this._PrivateChatUserItemRendererSkin_NameDisplay1_i(), this._PrivateChatUserItemRendererSkin_Button1_i()];
            _loc_1.id = "contentGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.contentGroup = _loc_1;
            BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.width = 12;
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_NameDisplay1_i() : NameDisplay
        {
            var _loc_1:* = new NameDisplay();
            _loc_1.percentWidth = 100;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("paddingLeft", 2);
            _loc_1.setStyle("paddingTop", 4);
            _loc_1.id = "nameDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nameDisplay = _loc_1;
            BindingManager.executeBindings(this, "nameDisplay", this.nameDisplay);
            return _loc_1;
        }// end function

        private function _PrivateChatUserItemRendererSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "close";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.close = _loc_1;
            BindingManager.executeBindings(this, "close", this.close);
            return _loc_1;
        }// end function

        public function ___PrivateChatUserItemRendererSkin_Skin1_initialize(event:FlexEvent) : void
        {
            this.initializeHandler(event);
            return;
        }// end function

        private function _PrivateChatUserItemRendererSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [stroke, fill];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_PrivateChatUserItemRendererSkin_AnimateColor1.targets");
            return result;
        }// end function

        public function get close() : Button
        {
            return this._94756344close;
        }// end function

        public function set close(param1:Button) : void
        {
            var _loc_2:* = this._94756344close;
            if (_loc_2 !== param1)
            {
                this._94756344close = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "close", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get contentGroup() : HGroup
        {
            return this._809612678contentGroup;
        }// end function

        public function set contentGroup(param1:HGroup) : void
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

        public function get fill() : SolidColor
        {
            return this._3143043fill;
        }// end function

        public function set fill(param1:SolidColor) : void
        {
            var _loc_2:* = this._3143043fill;
            if (_loc_2 !== param1)
            {
                this._3143043fill = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fill", _loc_2, param1));
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

        public function get nameDisplay() : NameDisplay
        {
            return this._1844466615nameDisplay;
        }// end function

        public function set nameDisplay(param1:NameDisplay) : void
        {
            var _loc_2:* = this._1844466615nameDisplay;
            if (_loc_2 !== param1)
            {
                this._1844466615nameDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get popupOverlayDisplay() : ClassFactory
        {
            return this._4222434popupOverlayDisplay;
        }// end function

        public function set popupOverlayDisplay(param1:ClassFactory) : void
        {
            var _loc_2:* = this._4222434popupOverlayDisplay;
            if (_loc_2 !== param1)
            {
                this._4222434popupOverlayDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popupOverlayDisplay", _loc_2, param1));
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

        public function get hostComponent() : PrivateChatUserItemRenderer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:PrivateChatUserItemRenderer) : void
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
            PrivateChatUserItemRendererSkin._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
