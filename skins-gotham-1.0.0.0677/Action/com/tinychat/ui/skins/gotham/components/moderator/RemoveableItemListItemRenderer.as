package com.tinychat.ui.skins.gotham.components.moderator
{
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.skins.gotham.components.social.chat.*;
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

    public class RemoveableItemListItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
    {
        public var _RemoveableItemListItemRenderer_AnimateColor1:AnimateColor;
        private var _204859874bgColor:SolidColor;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function RemoveableItemListItemRenderer()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._RemoveableItemListItemRenderer_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_moderator_RemoveableItemListItemRendererWatcherSetupUtil");
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
            this.autoDrawBackground = false;
            this.height = 30;
            this.mouseEnabled = false;
            this.transitions = [this._RemoveableItemListItemRenderer_Transition1_c()];
            this.mxmlContent = [this._RemoveableItemListItemRenderer_Rect1_c(), this._RemoveableItemListItemRenderer_Rect2_c(), this._RemoveableItemListItemRenderer_HGroup1_c()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"hovered", overrides:[new SetProperty().initializeFromObject({target:"bgColor", name:"color", value:16774131})]})];
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

        override public function set data(param1:Object) : void
        {
            var _loc_2:NamedListItem = null;
            super.data = param1;
            if (param1 != null)
            {
                _loc_2 = NamedListItem(param1);
                labelDisplay.text = _loc_2.name;
            }
            return;
        }// end function

        private function _RemoveableItemListItemRenderer_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = true;
            _loc_1.effect = this._RemoveableItemListItemRenderer_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._RemoveableItemListItemRenderer_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_RemoveableItemListItemRenderer_AnimateColor1", this._RemoveableItemListItemRenderer_AnimateColor1);
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._RemoveableItemListItemRenderer_SolidColor1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            this.bgColor = _loc_1;
            BindingManager.executeBindings(this, "bgColor", this.bgColor);
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = -1;
            _loc_1.top = 0;
            _loc_1.bottom = -1;
            _loc_1.stroke = this._RemoveableItemListItemRenderer_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 15132390;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.verticalAlign = "middle";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._RemoveableItemListItemRenderer_Label1_i(), this._RemoveableItemListItemRenderer_Button1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.mouseEnabled = false;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.showTruncationTip = true;
            _loc_1.setStyle("paddingTop", 2);
            _loc_1.setStyle("color", 0);
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", labelDisplay);
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_Button1_c() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.label = "Remove";
            _loc_1.setStyle("skinClass", PrivateChatCloseButtonSkin);
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _RemoveableItemListItemRenderer_bindingsSetup() : Array
        {
            var _loc_1:Array = [];
            _loc_1[0] = new Binding(this, null, null, "_RemoveableItemListItemRenderer_AnimateColor1.target", "bgColor");
            return _loc_1;
        }// end function

        public function get bgColor() : SolidColor
        {
            return this._204859874bgColor;
        }// end function

        public function set bgColor(param1:SolidColor) : void
        {
            var _loc_2:* = this._204859874bgColor;
            if (_loc_2 !== param1)
            {
                this._204859874bgColor = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgColor", _loc_2, param1));
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
