package com.tinychat.ui.skins.gotham.components.userinfo
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.userinfo.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class TinychatUserinfoScreenSkin extends Skin implements IStateClient2
    {
        private var _2067897192_TinychatUserinfoScreenSkin_Group1:Group;
        public var _TinychatUserinfoScreenSkin_Group2:Group;
        public var _TinychatUserinfoScreenSkin_VGroup1:VGroup;
        public var _TinychatUserinfoScreenSkin_VGroup2:VGroup;
        private var _1405959847avatar:AdvancedBitmapImage;
        private var _632224410bioDisplay:RichEditableText;
        private var _1421542979followButton:FollowButton;
        private var _422451185followerCountDisplay:Label;
        private var _1902191530followerCountIcon:AdvancedBitmapImage;
        private var _1539435341locationDisplay:Label;
        private var _268660470notFoundMessageDisplay:Label;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _2091297548usernameDisplay:RichEditableText;
        private var _274594727websiteDisplay:RichEditableText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_icons_users_enabled_png_1637548655:Class;
        private var _213507019hostComponent:TinychatUserinfoScreen;

        public function TinychatUserinfoScreenSkin()
        {
            this._embed_mxml__images_icons_users_enabled_png_1637548655 = TinychatUserinfoScreenSkin__embed_mxml__images_icons_users_enabled_png_1637548655;
            mx_internal::_document = this;
            this.width = 380;
            this.maxHeight = 250;
            this.layout = this._TinychatUserinfoScreenSkin_VerticalLayout1_c();
            this.mxmlContent = [this._TinychatUserinfoScreenSkin_Group1_i()];
            this.currentState = "found";
            var _loc_1:* = new DeferredInstanceFromFunction(this._TinychatUserinfoScreenSkin_AdvancedBitmapImage1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._TinychatUserinfoScreenSkin_Group2_i);
            var _loc_3:* = new DeferredInstanceFromFunction(this._TinychatUserinfoScreenSkin_Label2_i);
            var _loc_4:* = new DeferredInstanceFromFunction(this._TinychatUserinfoScreenSkin_VGroup1_i);
            var _loc_5:* = new DeferredInstanceFromFunction(this._TinychatUserinfoScreenSkin_VGroup2_i);
            states = [new State({name:"found", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_TinychatUserinfoScreenSkin_Group1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_5, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_TinychatUserinfoScreenSkin_Group1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_4, destination:"_TinychatUserinfoScreenSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["titleDisplay"]}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_TinychatUserinfoScreenSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["titleDisplay"]})]}), new State({name:"notFound", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_TinychatUserinfoScreenSkin_Group1"]})]})];
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

        private function _TinychatUserinfoScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 10;
            _loc_1.horizontalAlign = "justify";
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.height = 60;
            _loc_1.mxmlContent = [this._TinychatUserinfoScreenSkin_TitleDisplay1_i()];
            _loc_1.id = "_TinychatUserinfoScreenSkin_Group1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._TinychatUserinfoScreenSkin_Group1 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUserinfoScreenSkin_Group1", this._TinychatUserinfoScreenSkin_Group1);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_AdvancedBitmapImage1_i() : AdvancedBitmapImage
        {
            var _loc_1:* = new AdvancedBitmapImage();
            _loc_1.left = 5;
            _loc_1.width = 50;
            _loc_1.top = 5;
            _loc_1.height = 50;
            _loc_1.initialized(this, "avatar");
            this.avatar = _loc_1;
            BindingManager.executeBindings(this, "avatar", this.avatar);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 65;
            _loc_1.bottom = 10;
            _loc_1.percentWidth = 100;
            _loc_1.gap = 5;
            _loc_1.mxmlContent = [this._TinychatUserinfoScreenSkin_RichEditableText1_i(), this._TinychatUserinfoScreenSkin_Label1_i()];
            _loc_1.id = "_TinychatUserinfoScreenSkin_VGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._TinychatUserinfoScreenSkin_VGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUserinfoScreenSkin_VGroup1", this._TinychatUserinfoScreenSkin_VGroup1);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_RichEditableText1_i() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.percentWidth = 100;
            _loc_1.editable = false;
            _loc_1.id = "usernameDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.usernameDisplay = _loc_1;
            BindingManager.executeBindings(this, "usernameDisplay", this.usernameDisplay);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.id = "locationDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.locationDisplay = _loc_1;
            BindingManager.executeBindings(this, "locationDisplay", this.locationDisplay);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("paddingBottom", 15);
            _loc_1.id = "notFoundMessageDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.notFoundMessageDisplay = _loc_1;
            BindingManager.executeBindings(this, "notFoundMessageDisplay", this.notFoundMessageDisplay);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_VGroup2_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentHeight = 100;
            _loc_1.horizontalAlign = "justify";
            _loc_1.gap = 15;
            _loc_1.paddingLeft = 15;
            _loc_1.paddingRight = 15;
            _loc_1.mxmlContent = [this._TinychatUserinfoScreenSkin_Scroller1_c(), this._TinychatUserinfoScreenSkin_RichEditableText3_i()];
            _loc_1.id = "_TinychatUserinfoScreenSkin_VGroup2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._TinychatUserinfoScreenSkin_VGroup2 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUserinfoScreenSkin_VGroup2", this._TinychatUserinfoScreenSkin_VGroup2);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_Scroller1_c() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.percentHeight = 100;
            _loc_1.viewport = this._TinychatUserinfoScreenSkin_RichEditableText2_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_RichEditableText2_i() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.editable = false;
            _loc_1.clipAndEnableScrolling = true;
            _loc_1.id = "bioDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.bioDisplay = _loc_1;
            BindingManager.executeBindings(this, "bioDisplay", this.bioDisplay);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_RichEditableText3_i() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.editable = false;
            _loc_1.id = "websiteDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.websiteDisplay = _loc_1;
            BindingManager.executeBindings(this, "websiteDisplay", this.websiteDisplay);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.height = 45;
            _loc_1.mxmlContent = [this._TinychatUserinfoScreenSkin_Line1_c(), this._TinychatUserinfoScreenSkin_HGroup1_c()];
            _loc_1.id = "_TinychatUserinfoScreenSkin_Group2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._TinychatUserinfoScreenSkin_Group2 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatUserinfoScreenSkin_Group2", this._TinychatUserinfoScreenSkin_Group2);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.stroke = this._TinychatUserinfoScreenSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13421772;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 10;
            _loc_1.right = 10;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.horizontalAlign = "center";
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._TinychatUserinfoScreenSkin_AdvancedBitmapImage2_i(), this._TinychatUserinfoScreenSkin_Label3_i(), this._TinychatUserinfoScreenSkin_FollowButton1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_AdvancedBitmapImage2_i() : AdvancedBitmapImage
        {
            var _loc_1:* = new AdvancedBitmapImage();
            _loc_1.source = this._embed_mxml__images_icons_users_enabled_png_1637548655;
            _loc_1.initialized(this, "followerCountIcon");
            this.followerCountIcon = _loc_1;
            BindingManager.executeBindings(this, "followerCountIcon", this.followerCountIcon);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_Label3_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("paddingTop", 1);
            _loc_1.id = "followerCountDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.followerCountDisplay = _loc_1;
            BindingManager.executeBindings(this, "followerCountDisplay", this.followerCountDisplay);
            return _loc_1;
        }// end function

        private function _TinychatUserinfoScreenSkin_FollowButton1_i() : FollowButton
        {
            var _loc_1:* = new FollowButton();
            _loc_1.width = 150;
            _loc_1.percentHeight = 90;
            _loc_1.id = "followButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.followButton = _loc_1;
            BindingManager.executeBindings(this, "followButton", this.followButton);
            return _loc_1;
        }// end function

        public function get _TinychatUserinfoScreenSkin_Group1() : Group
        {
            return this._2067897192_TinychatUserinfoScreenSkin_Group1;
        }// end function

        public function set _TinychatUserinfoScreenSkin_Group1(param1:Group) : void
        {
            var _loc_2:* = this._2067897192_TinychatUserinfoScreenSkin_Group1;
            if (_loc_2 !== param1)
            {
                this._2067897192_TinychatUserinfoScreenSkin_Group1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_TinychatUserinfoScreenSkin_Group1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get avatar() : AdvancedBitmapImage
        {
            return this._1405959847avatar;
        }// end function

        public function set avatar(param1:AdvancedBitmapImage) : void
        {
            var _loc_2:* = this._1405959847avatar;
            if (_loc_2 !== param1)
            {
                this._1405959847avatar = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "avatar", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get bioDisplay() : RichEditableText
        {
            return this._632224410bioDisplay;
        }// end function

        public function set bioDisplay(param1:RichEditableText) : void
        {
            var _loc_2:* = this._632224410bioDisplay;
            if (_loc_2 !== param1)
            {
                this._632224410bioDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bioDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get followButton() : FollowButton
        {
            return this._1421542979followButton;
        }// end function

        public function set followButton(param1:FollowButton) : void
        {
            var _loc_2:* = this._1421542979followButton;
            if (_loc_2 !== param1)
            {
                this._1421542979followButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "followButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get followerCountDisplay() : Label
        {
            return this._422451185followerCountDisplay;
        }// end function

        public function set followerCountDisplay(param1:Label) : void
        {
            var _loc_2:* = this._422451185followerCountDisplay;
            if (_loc_2 !== param1)
            {
                this._422451185followerCountDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "followerCountDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get followerCountIcon() : AdvancedBitmapImage
        {
            return this._1902191530followerCountIcon;
        }// end function

        public function set followerCountIcon(param1:AdvancedBitmapImage) : void
        {
            var _loc_2:* = this._1902191530followerCountIcon;
            if (_loc_2 !== param1)
            {
                this._1902191530followerCountIcon = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "followerCountIcon", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get locationDisplay() : Label
        {
            return this._1539435341locationDisplay;
        }// end function

        public function set locationDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1539435341locationDisplay;
            if (_loc_2 !== param1)
            {
                this._1539435341locationDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "locationDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get notFoundMessageDisplay() : Label
        {
            return this._268660470notFoundMessageDisplay;
        }// end function

        public function set notFoundMessageDisplay(param1:Label) : void
        {
            var _loc_2:* = this._268660470notFoundMessageDisplay;
            if (_loc_2 !== param1)
            {
                this._268660470notFoundMessageDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "notFoundMessageDisplay", _loc_2, param1));
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

        public function get usernameDisplay() : RichEditableText
        {
            return this._2091297548usernameDisplay;
        }// end function

        public function set usernameDisplay(param1:RichEditableText) : void
        {
            var _loc_2:* = this._2091297548usernameDisplay;
            if (_loc_2 !== param1)
            {
                this._2091297548usernameDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "usernameDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get websiteDisplay() : RichEditableText
        {
            return this._274594727websiteDisplay;
        }// end function

        public function set websiteDisplay(param1:RichEditableText) : void
        {
            var _loc_2:* = this._274594727websiteDisplay;
            if (_loc_2 !== param1)
            {
                this._274594727websiteDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "websiteDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : TinychatUserinfoScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TinychatUserinfoScreen) : void
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

    }
}
