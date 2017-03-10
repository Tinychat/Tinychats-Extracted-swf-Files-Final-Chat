package com.tinychat.ui.skins.gotham.components.social.userslist
{
    import com.tinychat.model.business.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.components.gifts.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.effects.*;
    import spark.primitives.*;

    public class TinychatUsersListItemRenderer extends AdvancedItemRenderer implements IBindingClient, IStateClient2
    {
        public var _TinychatUsersListItemRenderer_AnimateColor1:AnimateColor;
        public var _TinychatUsersListItemRenderer_Line1:Line;
        public var _TinychatUsersListItemRenderer_Line2:Line;
        public var _TinychatUsersListItemRenderer_Line3:Line;
        public var _TinychatUsersListItemRenderer_Rect1:Rect;
        private var _1687773128_TinychatUsersListItemRenderer_SolidColorStroke2:SolidColorStroke;
        private var _1747619631achievement:BitmapImage;
        private var _1287124693backgroundColor:SolidColor;
        private var _191133567broadcasterIndicator:BroadcastIcon;
        private var _885416171butBuyGift:BuyGiftButton;
        private var _155217245ignoredIndicator:BlockedIcon;
        private var _852569547operatorIndicator:ModeratorIcon;
        private var _1869930878registered:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        private var user:TinychatUserListItem;
        private var itemIndexChanged:Boolean;
        private var dataChanged:Boolean;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function TinychatUsersListItemRenderer()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._TinychatUsersListItemRenderer_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_social_userslist_TinychatUsersListItemRendererWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return TinychatUsersListItemRenderer[param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.autoDrawBackground = false;
            this.height = 32;
            this.transitions = [this._TinychatUsersListItemRenderer_Transition1_c()];
            this.mxmlContent = [this._TinychatUsersListItemRenderer_Rect1_i(), this._TinychatUsersListItemRenderer_Line2_i(), this._TinychatUsersListItemRenderer_Label1_i(), this._TinychatUsersListItemRenderer_ModeratorIcon1_i(), this._TinychatUsersListItemRenderer_BroadcastIcon1_i(), this._TinychatUsersListItemRenderer_Group1_i(), this._TinychatUsersListItemRenderer_BitmapImage1_i(), this._TinychatUsersListItemRenderer_BlockedIcon1_i()];
            this.currentState = "normal";
            var _TinychatUsersListItemRenderer_Line1_factory:* = new DeferredInstanceFromFunction(this._TinychatUsersListItemRenderer_Line1_i);
            var _TinychatUsersListItemRenderer_Line3_factory:* = new DeferredInstanceFromFunction(this._TinychatUsersListItemRenderer_Line3_i);
            states = [new State({name:"normal", overrides:[]}), new State({name:"hovered", overrides:[new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15071999}), new SetProperty().initializeFromObject({target:"_TinychatUsersListItemRenderer_SolidColorStroke2", name:"color", value:14216690}), new SetProperty().initializeFromObject({target:"butBuyGift", name:"visible", value:true})]}), new State({name:"down", overrides:[new AddItems().initializeFromObject({itemsFactory:_TinychatUsersListItemRenderer_Line3_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_TinychatUsersListItemRenderer_Line2"]}), new AddItems().initializeFromObject({itemsFactory:_TinychatUsersListItemRenderer_Line1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_TinychatUsersListItemRenderer_Rect1"]}), new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15071999}), new SetProperty().initializeFromObject({target:"butBuyGift", name:"visible", value:true})]})];
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

        override public function get data() : Object
        {
            return this.user;
        }// end function

        override public function set data(param1:Object) : void
        {
            if (this.user != param1)
            {
                this.user = TinychatUserListItem(param1);
            }
            this.dataChanged = true;
            invalidateProperties();
            return;
        }// end function

        override public function set itemIndex(param1:int) : void
        {
            if (itemIndex != param1)
            {
                super.itemIndex = param1;
                this.itemIndexChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:uint = 0;
            var _loc_2:String = null;
            super.commitProperties();
            if (this.dataChanged)
            {
            }
            if (this.user)
            {
                this.updateIndicators();
                this.achievement.source = this.user.achievement;
                labelDisplay.text = this.user.name;
                _loc_1 = 5460819;
                if (Roles.isPro(this.user.pro))
                {
                    _loc_1 = 2070553;
                }
                else if (Roles.isExtreme(this.user.pro))
                {
                    _loc_1 = 8461186;
                }
                else if (Roles.isGold(this.user.pro))
                {
                    _loc_1 = 15836672;
                }
                if (!this.user.isCurrentUser)
                {
                }
                _loc_2 = this.user.pro ? ("bold") : ("normal");
                labelDisplay.setStyle("fontWeight", _loc_2);
                labelDisplay.setStyle("color", _loc_1);
                this.dataChanged = false;
            }
            if (this.itemIndexChanged)
            {
            }
            if (this.backgroundColor)
            {
                if (itemIndex % 2)
                {
                    this.backgroundColor.color = 16383999;
                }
                else
                {
                    this.backgroundColor.color = 16777215;
                }
                this.itemIndexChanged = false;
            }
            return;
        }// end function

        private function updateIndicators() : void
        {
            this.toggleElementVisibility(this.registered, this.user.account != "");
            this.toggleElementVisibility(this.achievement, !this.user.ignored);
            this.toggleElementVisibility(this.operatorIndicator, this.user.operator);
            this.toggleElementVisibility(this.broadcasterIndicator, this.user.broadcasting);
            this.toggleElementVisibility(this.ignoredIndicator, this.user.ignored);
            return;
        }// end function

        private function toggleElementVisibility(param1:IVisualElement, param2:Boolean) : void
        {
            param1.visible = param2;
            param1.includeInLayout = param2;
            return;
        }// end function

        private function _TinychatUsersListItemRenderer_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = true;
            _loc_1.effect = this._TinychatUsersListItemRenderer_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 100;
            this._TinychatUsersListItemRenderer_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUsersListItemRenderer_AnimateColor1", this._TinychatUsersListItemRenderer_AnimateColor1);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 1;
            _loc_1.fill = this._TinychatUsersListItemRenderer_SolidColor1_i();
            _loc_1.initialized(this, "_TinychatUsersListItemRenderer_Rect1");
            this._TinychatUsersListItemRenderer_Rect1 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUsersListItemRenderer_Rect1", this._TinychatUsersListItemRenderer_Rect1);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            this.backgroundColor = _loc_1;
            BindingManager.executeBindings(this, "backgroundColor", this.backgroundColor);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_Line1_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.stroke = this._TinychatUsersListItemRenderer_SolidColorStroke1_c();
            _loc_1.initialized(this, "_TinychatUsersListItemRenderer_Line1");
            this._TinychatUsersListItemRenderer_Line1 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUsersListItemRenderer_Line1", this._TinychatUsersListItemRenderer_Line1);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13429231;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_Line2_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.stroke = this._TinychatUsersListItemRenderer_SolidColorStroke2_i();
            _loc_1.initialized(this, "_TinychatUsersListItemRenderer_Line2");
            this._TinychatUsersListItemRenderer_Line2 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUsersListItemRenderer_Line2", this._TinychatUsersListItemRenderer_Line2);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_SolidColorStroke2_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 15921906;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            this._TinychatUsersListItemRenderer_SolidColorStroke2 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUsersListItemRenderer_SolidColorStroke2", this._TinychatUsersListItemRenderer_SolidColorStroke2);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_Line3_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 1;
            _loc_1.stroke = this._TinychatUsersListItemRenderer_SolidColorStroke3_c();
            _loc_1.initialized(this, "_TinychatUsersListItemRenderer_Line3");
            this._TinychatUsersListItemRenderer_Line3 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUsersListItemRenderer_Line3", this._TinychatUsersListItemRenderer_Line3);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_SolidColorStroke3_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13429231;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 26;
            _loc_1.right = 48;
            _loc_1.verticalCenter = 2;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", labelDisplay);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_ModeratorIcon1_i() : ModeratorIcon
        {
            var _loc_1:* = new ModeratorIcon();
            _loc_1.width = 14;
            _loc_1.height = 14;
            _loc_1.verticalCenter = 0;
            _loc_1.right = 29;
            _loc_1.initialized(this, "operatorIndicator");
            this.operatorIndicator = _loc_1;
            BindingManager.executeBindings(this, "operatorIndicator", this.operatorIndicator);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_BroadcastIcon1_i() : BroadcastIcon
        {
            var _loc_1:* = new BroadcastIcon();
            _loc_1.width = 14;
            _loc_1.height = 10;
            _loc_1.verticalCenter = 0;
            _loc_1.right = 9;
            _loc_1.initialized(this, "broadcasterIndicator");
            this.broadcasterIndicator = _loc_1;
            BindingManager.executeBindings(this, "broadcasterIndicator", this.broadcasterIndicator);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.right = 6;
            _loc_1.verticalCenter = 1;
            _loc_1.mxmlContent = [this._TinychatUsersListItemRenderer_BuyGiftButton1_i()];
            _loc_1.id = "registered";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.registered = _loc_1;
            BindingManager.executeBindings(this, "registered", this.registered);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_BuyGiftButton1_i() : BuyGiftButton
        {
            var _loc_1:* = new BuyGiftButton();
            _loc_1.visible = false;
            _loc_1.id = "butBuyGift";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.butBuyGift = _loc_1;
            BindingManager.executeBindings(this, "butBuyGift", this.butBuyGift);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.left = 6;
            _loc_1.verticalCenter = 0;
            _loc_1.maxWidth = 16;
            _loc_1.maxHeight = 16;
            _loc_1.initialized(this, "achievement");
            this.achievement = _loc_1;
            BindingManager.executeBindings(this, "achievement", this.achievement);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_BlockedIcon1_i() : BlockedIcon
        {
            var _loc_1:* = new BlockedIcon();
            _loc_1.width = 14;
            _loc_1.height = 14;
            _loc_1.verticalCenter = 0;
            _loc_1.left = 7;
            _loc_1.initialized(this, "ignoredIndicator");
            this.ignoredIndicator = _loc_1;
            BindingManager.executeBindings(this, "ignoredIndicator", this.ignoredIndicator);
            return _loc_1;
        }// end function

        private function _TinychatUsersListItemRenderer_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [backgroundColor];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_TinychatUsersListItemRenderer_AnimateColor1.targets");
            return result;
        }// end function

        public function get _TinychatUsersListItemRenderer_SolidColorStroke2() : SolidColorStroke
        {
            return this._1687773128_TinychatUsersListItemRenderer_SolidColorStroke2;
        }// end function

        public function set _TinychatUsersListItemRenderer_SolidColorStroke2(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._1687773128_TinychatUsersListItemRenderer_SolidColorStroke2;
            if (_loc_2 !== param1)
            {
                this._1687773128_TinychatUsersListItemRenderer_SolidColorStroke2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TinychatUsersListItemRenderer_SolidColorStroke2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get achievement() : BitmapImage
        {
            return this._1747619631achievement;
        }// end function

        public function set achievement(param1:BitmapImage) : void
        {
            var _loc_2:* = this._1747619631achievement;
            if (_loc_2 !== param1)
            {
                this._1747619631achievement = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achievement", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get backgroundColor() : SolidColor
        {
            return this._1287124693backgroundColor;
        }// end function

        public function set backgroundColor(param1:SolidColor) : void
        {
            var _loc_2:* = this._1287124693backgroundColor;
            if (_loc_2 !== param1)
            {
                this._1287124693backgroundColor = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundColor", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get broadcasterIndicator() : BroadcastIcon
        {
            return this._191133567broadcasterIndicator;
        }// end function

        public function set broadcasterIndicator(param1:BroadcastIcon) : void
        {
            var _loc_2:* = this._191133567broadcasterIndicator;
            if (_loc_2 !== param1)
            {
                this._191133567broadcasterIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "broadcasterIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get butBuyGift() : BuyGiftButton
        {
            return this._885416171butBuyGift;
        }// end function

        public function set butBuyGift(param1:BuyGiftButton) : void
        {
            var _loc_2:* = this._885416171butBuyGift;
            if (_loc_2 !== param1)
            {
                this._885416171butBuyGift = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "butBuyGift", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get ignoredIndicator() : BlockedIcon
        {
            return this._155217245ignoredIndicator;
        }// end function

        public function set ignoredIndicator(param1:BlockedIcon) : void
        {
            var _loc_2:* = this._155217245ignoredIndicator;
            if (_loc_2 !== param1)
            {
                this._155217245ignoredIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ignoredIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get operatorIndicator() : ModeratorIcon
        {
            return this._852569547operatorIndicator;
        }// end function

        public function set operatorIndicator(param1:ModeratorIcon) : void
        {
            var _loc_2:* = this._852569547operatorIndicator;
            if (_loc_2 !== param1)
            {
                this._852569547operatorIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "operatorIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get registered() : Group
        {
            return this._1869930878registered;
        }// end function

        public function set registered(param1:Group) : void
        {
            var _loc_2:* = this._1869930878registered;
            if (_loc_2 !== param1)
            {
                this._1869930878registered = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "registered", _loc_2, param1));
                }
            }
            return;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            TinychatUsersListItemRenderer._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
