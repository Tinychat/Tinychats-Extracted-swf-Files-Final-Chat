package com.tinychat.ui.skins.gotham.components.social.userslist
{
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.components.invite.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.display.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.effects.*;
    import spark.primitives.*;

    public class SocialNetworkUsersListItemRenderer extends AdvancedItemRenderer implements IBindingClient, IStateClient2
    {
        public var _SocialNetworkUsersListItemRenderer_AnimateColor1:AnimateColor;
        public var _SocialNetworkUsersListItemRenderer_Line1:Line;
        public var _SocialNetworkUsersListItemRenderer_Rect1:Rect;
        private var _1287124693backgroundColor:SolidColor;
        private var _155217245ignoredIndicator:VectorImage;
        private var _1374399316presenceIndicator:InviteFriendsPresenceIndicator;
        private var _879608141userPicture:BitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        public var defaultAvatar:Class;
        private var user:SocialNetworkUserListItem;
        private var dataChanged:Boolean;
        private var itemIndexChanged:Boolean;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function SocialNetworkUsersListItemRenderer()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this.defaultAvatar = SocialNetworkUsersListItemRenderer_defaultAvatar;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._SocialNetworkUsersListItemRenderer_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_social_userslist_SocialNetworkUsersListItemRendererWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return SocialNetworkUsersListItemRenderer[param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.autoDrawBackground = false;
            this.transitions = [this._SocialNetworkUsersListItemRenderer_Transition1_c()];
            this.mxmlContent = [this._SocialNetworkUsersListItemRenderer_Rect1_i(), this._SocialNetworkUsersListItemRenderer_HGroup1_c()];
            this.currentState = "normal";
            var _SocialNetworkUsersListItemRenderer_Line1_factory:* = new DeferredInstanceFromFunction(this._SocialNetworkUsersListItemRenderer_Line1_i);
            states = [new State({name:"normal", overrides:[]}), new State({name:"hovered", overrides:[new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15071999})]}), new State({name:"down", overrides:[new AddItems().initializeFromObject({itemsFactory:_SocialNetworkUsersListItemRenderer_Line1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_SocialNetworkUsersListItemRenderer_Rect1"]}), new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15071999})]})];
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
            if (this.user)
            {
                this.user.pictureLoaded.remove(this.pictureLoadedHandler);
            }
            super.data = param1;
            if (param1 != null)
            {
                this.user = data as SocialNetworkUserListItem;
                this.dataChanged = true;
                invalidateProperties();
            }
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
            super.commitProperties();
            if (this.dataChanged)
            {
            }
            if (this.user)
            {
                this.updateIndicators();
                labelDisplay.text = this.user.name;
                this.presenceIndicator.presence = this.user.presence;
                if (this.user.isPictureLoaded)
                {
                    this.userPicture.source = this.user.picture;
                }
                else
                {
                    this.userPicture.source = this.defaultAvatar;
                    this.user.pictureLoaded.addOnce(this.pictureLoadedHandler);
                    this.user.loadPicture();
                }
                this.dataChanged = false;
            }
            if (this.itemIndexChanged)
            {
            }
            if (this.backgroundColor)
            {
                if (itemIndex % 2)
                {
                    this.backgroundColor.color = 16383486;
                }
                else
                {
                    this.backgroundColor.color = 16777215;
                }
                this.itemIndexChanged = false;
            }
            return;
        }// end function

        private function pictureLoadedHandler(param1:DisplayObject) : void
        {
            this.userPicture.source = param1;
            return;
        }// end function

        private function showHandCursor() : void
        {
            mouseChildren = false;
            useHandCursor = true;
            buttonMode = true;
            return;
        }// end function

        private function updateIndicators() : void
        {
            if (this.user.hasOwnProperty("blocked"))
            {
                this.user.hasOwnProperty("blocked");
            }
            this.toggleElementVisibility(this.ignoredIndicator, this.user["blocked"] == true);
            return;
        }// end function

        private function toggleElementVisibility(param1:IVisualElement, param2:Boolean) : void
        {
            param1.visible = param2;
            param1.includeInLayout = param2;
            return;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.autoReverse = true;
            _loc_1.effect = this._SocialNetworkUsersListItemRenderer_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 100;
            this._SocialNetworkUsersListItemRenderer_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_SocialNetworkUsersListItemRenderer_AnimateColor1", this._SocialNetworkUsersListItemRenderer_AnimateColor1);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._SocialNetworkUsersListItemRenderer_SolidColor1_i();
            _loc_1.initialized(this, "_SocialNetworkUsersListItemRenderer_Rect1");
            this._SocialNetworkUsersListItemRenderer_Rect1 = _loc_1;
            BindingManager.executeBindings(this, "_SocialNetworkUsersListItemRenderer_Rect1", this._SocialNetworkUsersListItemRenderer_Rect1);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            this.backgroundColor = _loc_1;
            BindingManager.executeBindings(this, "backgroundColor", this.backgroundColor);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_Line1_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.stroke = this._SocialNetworkUsersListItemRenderer_SolidColorStroke1_c();
            _loc_1.initialized(this, "_SocialNetworkUsersListItemRenderer_Line1");
            this._SocialNetworkUsersListItemRenderer_Line1 = _loc_1;
            BindingManager.executeBindings(this, "_SocialNetworkUsersListItemRenderer_Line1", this._SocialNetworkUsersListItemRenderer_Line1);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13429231;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.percentWidth = 100;
            _loc_1.paddingLeft = 5;
            _loc_1.paddingRight = 5;
            _loc_1.paddingTop = 2;
            _loc_1.paddingBottom = 2;
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._SocialNetworkUsersListItemRenderer_Group1_c(), this._SocialNetworkUsersListItemRenderer_Label1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.mxmlContent = [this._SocialNetworkUsersListItemRenderer_Rect2_c(), this._SocialNetworkUsersListItemRenderer_BitmapImage1_i(), this._SocialNetworkUsersListItemRenderer_InviteFriendsPresenceIndicator1_i(), this._SocialNetworkUsersListItemRenderer_VectorImage1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._SocialNetworkUsersListItemRenderer_SolidColorStroke2_c();
            _loc_1.fill = this._SocialNetworkUsersListItemRenderer_SolidColor2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_SolidColorStroke2_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_SolidColor2_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.width = 22;
            _loc_1.height = 22;
            _loc_1.initialized(this, "userPicture");
            this.userPicture = _loc_1;
            BindingManager.executeBindings(this, "userPicture", this.userPicture);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_InviteFriendsPresenceIndicator1_i() : InviteFriendsPresenceIndicator
        {
            var _loc_1:* = new InviteFriendsPresenceIndicator();
            _loc_1.right = 1;
            _loc_1.bottom = 1;
            _loc_1.width = 11;
            _loc_1.height = 11;
            _loc_1.id = "presenceIndicator";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.presenceIndicator = _loc_1;
            BindingManager.executeBindings(this, "presenceIndicator", this.presenceIndicator);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.width = 9;
            _loc_1.height = 9;
            _loc_1.left = -2;
            _loc_1.bottom = 2;
            _loc_1.setStyle("tintColor", 14754606);
            _loc_1.id = "ignoredIndicator";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.ignoredIndicator = _loc_1;
            BindingManager.executeBindings(this, "ignoredIndicator", this.ignoredIndicator);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListItemRenderer_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.maxDisplayedLines = 1;
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

        private function _SocialNetworkUsersListItemRenderer_bindingsSetup() : Array
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
            , null, "_SocialNetworkUsersListItemRenderer_AnimateColor1.targets");
            result[1] = new Binding(this, function () : Object
            {
                return BlockedIcon;
            }// end function
            , null, "ignoredIndicator.source");
            return result;
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

        public function get ignoredIndicator() : VectorImage
        {
            return this._155217245ignoredIndicator;
        }// end function

        public function set ignoredIndicator(param1:VectorImage) : void
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

        public function get presenceIndicator() : InviteFriendsPresenceIndicator
        {
            return this._1374399316presenceIndicator;
        }// end function

        public function set presenceIndicator(param1:InviteFriendsPresenceIndicator) : void
        {
            var _loc_2:* = this._1374399316presenceIndicator;
            if (_loc_2 !== param1)
            {
                this._1374399316presenceIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "presenceIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get userPicture() : BitmapImage
        {
            return this._879608141userPicture;
        }// end function

        public function set userPicture(param1:BitmapImage) : void
        {
            var _loc_2:* = this._879608141userPicture;
            if (_loc_2 !== param1)
            {
                this._879608141userPicture = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userPicture", _loc_2, param1));
                }
            }
            return;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            SocialNetworkUsersListItemRenderer._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
