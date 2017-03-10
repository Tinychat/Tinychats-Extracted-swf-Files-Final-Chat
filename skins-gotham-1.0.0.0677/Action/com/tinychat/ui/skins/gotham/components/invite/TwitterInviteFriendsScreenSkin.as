package com.tinychat.ui.skins.gotham.components.invite
{
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class TwitterInviteFriendsScreenSkin extends Skin implements IStateClient2
    {
        public var _TwitterInviteFriendsScreenSkin_BitmapImage2:BitmapImage;
        public var _TwitterInviteFriendsScreenSkin_VGroup1:VGroup;
        public var _TwitterInviteFriendsScreenSkin_VGroup2:VGroup;
        private var _951117504confirm:Button;
        private var _1644494610followUsCheckbox:CheckBox;
        private var _399947769friendsFoundLabel:Label;
        private var _1405524947friendsList:MultipleSelectionList;
        private var _17757503selectedFriendsCountLabel:Label;
        private var _909318622statusLabel:Label;
        private var _1167261832tileLayout:TileLayout;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _713076478updateStatusCheckbox:CheckBox;
        private var _879608141userPicture:BitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_icons_twitter_default_avatar_png_1288776857:Class;
        private var _embed_mxml__images_icons_twitter_png_357296945:Class;
        private var _213507019hostComponent:TwitterInviteFriendsScreen;

        public function TwitterInviteFriendsScreenSkin()
        {
            this._embed_mxml__images_icons_twitter_default_avatar_png_1288776857 = TwitterInviteFriendsScreenSkin__embed_mxml__images_icons_twitter_default_avatar_png_1288776857;
            this._embed_mxml__images_icons_twitter_png_357296945 = TwitterInviteFriendsScreenSkin__embed_mxml__images_icons_twitter_png_357296945;
            mx_internal::_document = this;
            this.maxWidth = 510;
            this.mxmlContent = [this._TwitterInviteFriendsScreenSkin_TitleDisplay1_i(), this._TwitterInviteFriendsScreenSkin_Group1_c(), this._TwitterInviteFriendsScreenSkin_BitmapImage2_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._TwitterInviteFriendsScreenSkin_VGroup1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._TwitterInviteFriendsScreenSkin_VGroup2_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_TwitterInviteFriendsScreenSkin_BitmapImage2"]}), new SetProperty().initializeFromObject({name:"height", value:500})]}), new State({name:"loading", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_TwitterInviteFriendsScreenSkin_BitmapImage2"]})]})];
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

        override protected function measure() : void
        {
            super.measure();
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            if (this.tileLayout)
            {
            }
            if (!isNaN(param1))
            {
                this.tileLayout.columnWidth = Math.max(1, param1 / this.tileLayout.columnCount - 10);
            }
            return;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 60;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 3;
            _loc_1.top = 3;
            _loc_1.height = 52;
            _loc_1.mxmlContent = [this._TwitterInviteFriendsScreenSkin_Rect1_c(), this._TwitterInviteFriendsScreenSkin_BitmapImage1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._TwitterInviteFriendsScreenSkin_SolidColorStroke1_c();
            _loc_1.fill = this._TwitterInviteFriendsScreenSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.source = this._embed_mxml__images_icons_twitter_default_avatar_png_1288776857;
            _loc_1.initialized(this, "userPicture");
            this.userPicture = _loc_1;
            BindingManager.executeBindings(this, "userPicture", this.userPicture);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_BitmapImage2_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.left = 40;
            _loc_1.top = 32;
            _loc_1.width = 23;
            _loc_1.height = 24;
            _loc_1.source = this._embed_mxml__images_icons_twitter_png_357296945;
            _loc_1.initialized(this, "_TwitterInviteFriendsScreenSkin_BitmapImage2");
            this._TwitterInviteFriendsScreenSkin_BitmapImage2 = _loc_1;
            BindingManager.executeBindings(this, "_TwitterInviteFriendsScreenSkin_BitmapImage2", this._TwitterInviteFriendsScreenSkin_BitmapImage2);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.top = 70;
            _loc_1.paddingBottom = 20;
            _loc_1.horizontalCenter = 0;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._TwitterInviteFriendsScreenSkin_Label1_i()];
            _loc_1.id = "_TwitterInviteFriendsScreenSkin_VGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._TwitterInviteFriendsScreenSkin_VGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_TwitterInviteFriendsScreenSkin_VGroup1", this._TwitterInviteFriendsScreenSkin_VGroup1);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.id = "statusLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.statusLabel = _loc_1;
            BindingManager.executeBindings(this, "statusLabel", this.statusLabel);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_VGroup2_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 70;
            _loc_1.bottom = 0;
            _loc_1.gap = 15;
            _loc_1.paddingBottom = 10;
            _loc_1.mxmlContent = [this._TwitterInviteFriendsScreenSkin_Group2_c(), this._TwitterInviteFriendsScreenSkin_Group3_c(), this._TwitterInviteFriendsScreenSkin_Group4_c()];
            _loc_1.id = "_TwitterInviteFriendsScreenSkin_VGroup2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._TwitterInviteFriendsScreenSkin_VGroup2 = _loc_1;
            BindingManager.executeBindings(this, "_TwitterInviteFriendsScreenSkin_VGroup2", this._TwitterInviteFriendsScreenSkin_VGroup2);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Group2_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.minHeight = 33;
            _loc_1.mxmlContent = [this._TwitterInviteFriendsScreenSkin_Label2_i(), this._TwitterInviteFriendsScreenSkin_CheckBox1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 15;
            _loc_1.right = 200;
            _loc_1.verticalCenter = 0;
            _loc_1.maxDisplayedLines = 2;
            _loc_1.id = "friendsFoundLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.friendsFoundLabel = _loc_1;
            BindingManager.executeBindings(this, "friendsFoundLabel", this.friendsFoundLabel);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_CheckBox1_i() : CheckBox
        {
            var _loc_1:* = new CheckBox();
            _loc_1.right = 15;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "followUsCheckbox";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.followUsCheckbox = _loc_1;
            BindingManager.executeBindings(this, "followUsCheckbox", this.followUsCheckbox);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Group3_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.mxmlContent = [this._TwitterInviteFriendsScreenSkin_Scroller1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Scroller1_c() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.viewport = this._TwitterInviteFriendsScreenSkin_MultipleSelectionList1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_MultipleSelectionList1_i() : MultipleSelectionList
        {
            var _loc_1:* = new MultipleSelectionList();
            _loc_1.itemRenderer = this._TwitterInviteFriendsScreenSkin_ClassFactory1_c();
            _loc_1.layout = this._TwitterInviteFriendsScreenSkin_TileLayout1_i();
            _loc_1.id = "friendsList";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.friendsList = _loc_1;
            BindingManager.executeBindings(this, "friendsList", this.friendsList);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = TwitterInviteFriendsItemRenderer;
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_TileLayout1_i() : TileLayout
        {
            var _loc_1:* = new TileLayout();
            _loc_1.requestedColumnCount = 2;
            _loc_1.horizontalGap = 0;
            _loc_1.verticalGap = 0;
            _loc_1.columnAlign = "justifyUsingWidth";
            _loc_1.horizontalAlign = "justify";
            _loc_1.clipAndEnableScrolling = true;
            _loc_1.useVirtualLayout = true;
            this.tileLayout = _loc_1;
            BindingManager.executeBindings(this, "tileLayout", this.tileLayout);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Group4_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.minHeight = 45;
            _loc_1.mxmlContent = [this._TwitterInviteFriendsScreenSkin_Label3_i(), this._TwitterInviteFriendsScreenSkin_Button1_i(), this._TwitterInviteFriendsScreenSkin_VGroup3_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Label3_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 15;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "selectedFriendsCountLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.selectedFriendsCountLabel = _loc_1;
            BindingManager.executeBindings(this, "selectedFriendsCountLabel", this.selectedFriendsCountLabel);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 120;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_VGroup3_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.right = 15;
            _loc_1.verticalCenter = 0;
            _loc_1.mxmlContent = [this._TwitterInviteFriendsScreenSkin_CheckBox2_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterInviteFriendsScreenSkin_CheckBox2_i() : CheckBox
        {
            var _loc_1:* = new CheckBox();
            _loc_1.id = "updateStatusCheckbox";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.updateStatusCheckbox = _loc_1;
            BindingManager.executeBindings(this, "updateStatusCheckbox", this.updateStatusCheckbox);
            return _loc_1;
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

        public function get followUsCheckbox() : CheckBox
        {
            return this._1644494610followUsCheckbox;
        }// end function

        public function set followUsCheckbox(param1:CheckBox) : void
        {
            var _loc_2:* = this._1644494610followUsCheckbox;
            if (_loc_2 !== param1)
            {
                this._1644494610followUsCheckbox = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "followUsCheckbox", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get friendsFoundLabel() : Label
        {
            return this._399947769friendsFoundLabel;
        }// end function

        public function set friendsFoundLabel(param1:Label) : void
        {
            var _loc_2:* = this._399947769friendsFoundLabel;
            if (_loc_2 !== param1)
            {
                this._399947769friendsFoundLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "friendsFoundLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get friendsList() : MultipleSelectionList
        {
            return this._1405524947friendsList;
        }// end function

        public function set friendsList(param1:MultipleSelectionList) : void
        {
            var _loc_2:* = this._1405524947friendsList;
            if (_loc_2 !== param1)
            {
                this._1405524947friendsList = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "friendsList", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get selectedFriendsCountLabel() : Label
        {
            return this._17757503selectedFriendsCountLabel;
        }// end function

        public function set selectedFriendsCountLabel(param1:Label) : void
        {
            var _loc_2:* = this._17757503selectedFriendsCountLabel;
            if (_loc_2 !== param1)
            {
                this._17757503selectedFriendsCountLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedFriendsCountLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get statusLabel() : Label
        {
            return this._909318622statusLabel;
        }// end function

        public function set statusLabel(param1:Label) : void
        {
            var _loc_2:* = this._909318622statusLabel;
            if (_loc_2 !== param1)
            {
                this._909318622statusLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get tileLayout() : TileLayout
        {
            return this._1167261832tileLayout;
        }// end function

        public function set tileLayout(param1:TileLayout) : void
        {
            var _loc_2:* = this._1167261832tileLayout;
            if (_loc_2 !== param1)
            {
                this._1167261832tileLayout = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileLayout", _loc_2, param1));
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

        public function get updateStatusCheckbox() : CheckBox
        {
            return this._713076478updateStatusCheckbox;
        }// end function

        public function set updateStatusCheckbox(param1:CheckBox) : void
        {
            var _loc_2:* = this._713076478updateStatusCheckbox;
            if (_loc_2 !== param1)
            {
                this._713076478updateStatusCheckbox = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "updateStatusCheckbox", _loc_2, param1));
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

        public function get hostComponent() : TwitterInviteFriendsScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TwitterInviteFriendsScreen) : void
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
