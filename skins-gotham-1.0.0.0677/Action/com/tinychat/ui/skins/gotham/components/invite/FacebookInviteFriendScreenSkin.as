package com.tinychat.ui.skins.gotham.components.invite
{
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class FacebookInviteFriendScreenSkin extends Skin implements IBindingClient
    {
        public var _FacebookInviteFriendScreenSkin_VectorImage1:VectorImage;
        private var _951117504confirm:Button;
        private var _100358090input:InviteMessageInput;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _879608141userPicture:AdvancedBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_icons_facebook_default_avatar_png_135542103:Class;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:FacebookInviteFriendScreen;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function FacebookInviteFriendScreenSkin()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._embed_mxml__images_icons_facebook_default_avatar_png_135542103 = FacebookInviteFriendScreenSkin__embed_mxml__images_icons_facebook_default_avatar_png_135542103;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._FacebookInviteFriendScreenSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_invite_FacebookInviteFriendScreenSkinWatcherSetupUtil");
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
            this.minWidth = 510;
            this.mxmlContent = [this._FacebookInviteFriendScreenSkin_TitleDisplay1_i(), this._FacebookInviteFriendScreenSkin_Group1_c(), this._FacebookInviteFriendScreenSkin_VectorImage1_i(), this._FacebookInviteFriendScreenSkin_VGroup1_c()];
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

        private function _FacebookInviteFriendScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 60;
            _loc_1.mouseEnabled = false;
            _loc_1.mouseChildren = false;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 3;
            _loc_1.top = 3;
            _loc_1.height = 52;
            _loc_1.mouseEnabled = false;
            _loc_1.mouseChildren = false;
            _loc_1.mxmlContent = [this._FacebookInviteFriendScreenSkin_Rect1_c(), this._FacebookInviteFriendScreenSkin_AdvancedBitmapImage1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._FacebookInviteFriendScreenSkin_SolidColorStroke1_c();
            _loc_1.fill = this._FacebookInviteFriendScreenSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_AdvancedBitmapImage1_i() : AdvancedBitmapImage
        {
            var _loc_1:* = new AdvancedBitmapImage();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.source = this._embed_mxml__images_icons_facebook_default_avatar_png_135542103;
            _loc_1.initialized(this, "userPicture");
            this.userPicture = _loc_1;
            BindingManager.executeBindings(this, "userPicture", this.userPicture);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.left = 40;
            _loc_1.top = 32;
            _loc_1.width = 24;
            _loc_1.height = 24;
            _loc_1.id = "_FacebookInviteFriendScreenSkin_VectorImage1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._FacebookInviteFriendScreenSkin_VectorImage1 = _loc_1;
            BindingManager.executeBindings(this, "_FacebookInviteFriendScreenSkin_VectorImage1", this._FacebookInviteFriendScreenSkin_VectorImage1);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 70;
            _loc_1.bottom = 0;
            _loc_1.gap = 15;
            _loc_1.paddingBottom = 10;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._FacebookInviteFriendScreenSkin_Group2_c(), this._FacebookInviteFriendScreenSkin_Button1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_Group2_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.minHeight = 36;
            _loc_1.mxmlContent = [this._FacebookInviteFriendScreenSkin_InviteMessageInput1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_InviteMessageInput1_i() : InviteMessageInput
        {
            var _loc_1:* = new InviteMessageInput();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.setStyle("fontSize", 12);
            _loc_1.setStyle("errorSkin", ErrorSkin);
            _loc_1.id = "input";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.input = _loc_1;
            BindingManager.executeBindings(this, "input", this.input);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 120;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendScreenSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Object
            {
                return FacebookSquareLogo;
            }// end function
            , null, "_FacebookInviteFriendScreenSkin_VectorImage1.source");
            return result;
        }// end function

        public function get confirm() : Button
        {
            return this._951117504confirm;
        }// end function

        public function set confirm(param1:Button) : void
        {
            var _loc_2:* = this._951117504confirm;
            if (_loc_2 !== param1)
            {
                this._951117504confirm = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirm", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get input() : InviteMessageInput
        {
            return this._100358090input;
        }// end function

        public function set input(param1:InviteMessageInput) : void
        {
            var _loc_2:* = this._100358090input;
            if (_loc_2 !== param1)
            {
                this._100358090input = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "input", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get titleDisplay() : TitleDisplay
        {
            return this._1893287094titleDisplay;
        }// end function

        public function set titleDisplay(param1:TitleDisplay) : void
        {
            var _loc_2:* = this._1893287094titleDisplay;
            if (_loc_2 !== param1)
            {
                this._1893287094titleDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get userPicture() : AdvancedBitmapImage
        {
            return this._879608141userPicture;
        }// end function

        public function set userPicture(param1:AdvancedBitmapImage) : void
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

        public function get hostComponent() : FacebookInviteFriendScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:FacebookInviteFriendScreen) : void
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
