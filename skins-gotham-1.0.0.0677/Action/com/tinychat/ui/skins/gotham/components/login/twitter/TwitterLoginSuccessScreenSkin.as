package com.tinychat.ui.skins.gotham.components.login.twitter
{
    import com.tinychat.ui.components.login.twitter.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class TwitterLoginSuccessScreenSkin extends Skin
    {
        private var _951117504confirm:Button;
        private var _1103317861followOwnerCheckbox:CheckBox;
        private var _1644494610followUsCheckbox:CheckBox;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _713076478updateStatusCheckbox:CheckBox;
        private var _879608141userPicture:BitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_tc_twitter_sign_in_successful_png_2044096280:Class;
        private var _embed_mxml__images_icons_twitter_default_avatar_png_1288776857:Class;
        private var _embed_mxml__images_icons_twitter_png_357296945:Class;
        private var _213507019hostComponent:TwitterLoginSuccessScreen;

        public function TwitterLoginSuccessScreenSkin()
        {
            this._embed_mxml__images_tc_twitter_sign_in_successful_png_2044096280 = TwitterLoginSuccessScreenSkin__embed_mxml__images_tc_twitter_sign_in_successful_png_2044096280;
            this._embed_mxml__images_icons_twitter_default_avatar_png_1288776857 = TwitterLoginSuccessScreenSkin__embed_mxml__images_icons_twitter_default_avatar_png_1288776857;
            this._embed_mxml__images_icons_twitter_png_357296945 = TwitterLoginSuccessScreenSkin__embed_mxml__images_icons_twitter_png_357296945;
            mx_internal::_document = this;
            this.width = 510;
            this.layout = this._TwitterLoginSuccessScreenSkin_VerticalLayout1_c();
            this.mxmlContent = [this._TwitterLoginSuccessScreenSkin_Group1_c(), this._TwitterLoginSuccessScreenSkin_BitmapImage3_c(), this._TwitterLoginSuccessScreenSkin_Group3_c()];
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

        private function _TwitterLoginSuccessScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.horizontalAlign = "center";
            _loc_1.gap = 20;
            _loc_1.paddingBottom = 15;
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.height = 60;
            _loc_1.mxmlContent = [this._TwitterLoginSuccessScreenSkin_TitleDisplay1_i(), this._TwitterLoginSuccessScreenSkin_Group2_c(), this._TwitterLoginSuccessScreenSkin_BitmapImage2_c(), this._TwitterLoginSuccessScreenSkin_CheckBox1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_TitleDisplay1_i() : TitleDisplay
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

        private function _TwitterLoginSuccessScreenSkin_Group2_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 3;
            _loc_1.top = 3;
            _loc_1.height = 52;
            _loc_1.mxmlContent = [this._TwitterLoginSuccessScreenSkin_Rect1_c(), this._TwitterLoginSuccessScreenSkin_BitmapImage1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._TwitterLoginSuccessScreenSkin_SolidColorStroke1_c();
            _loc_1.fill = this._TwitterLoginSuccessScreenSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_BitmapImage1_i() : BitmapImage
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

        private function _TwitterLoginSuccessScreenSkin_BitmapImage2_c() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.left = 40;
            _loc_1.top = 32;
            _loc_1.width = 23;
            _loc_1.height = 24;
            _loc_1.source = this._embed_mxml__images_icons_twitter_png_357296945;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_CheckBox1_i() : CheckBox
        {
            var _loc_1:* = new CheckBox();
            _loc_1.right = 15;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "updateStatusCheckbox";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.updateStatusCheckbox = _loc_1;
            BindingManager.executeBindings(this, "updateStatusCheckbox", this.updateStatusCheckbox);
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_BitmapImage3_c() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.source = this._embed_mxml__images_tc_twitter_sign_in_successful_png_2044096280;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_Group3_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.mxmlContent = [this._TwitterLoginSuccessScreenSkin_Button1_i(), this._TwitterLoginSuccessScreenSkin_VGroup1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
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

        private function _TwitterLoginSuccessScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.right = 15;
            _loc_1.verticalCenter = 0;
            _loc_1.mxmlContent = [this._TwitterLoginSuccessScreenSkin_CheckBox2_i(), this._TwitterLoginSuccessScreenSkin_CheckBox3_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_CheckBox2_i() : CheckBox
        {
            var _loc_1:* = new CheckBox();
            _loc_1.id = "followUsCheckbox";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.followUsCheckbox = _loc_1;
            BindingManager.executeBindings(this, "followUsCheckbox", this.followUsCheckbox);
            return _loc_1;
        }// end function

        private function _TwitterLoginSuccessScreenSkin_CheckBox3_i() : CheckBox
        {
            var _loc_1:* = new CheckBox();
            _loc_1.id = "followOwnerCheckbox";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.followOwnerCheckbox = _loc_1;
            BindingManager.executeBindings(this, "followOwnerCheckbox", this.followOwnerCheckbox);
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

        public function get followOwnerCheckbox() : CheckBox
        {
            return this._1103317861followOwnerCheckbox;
        }// end function

        public function set followOwnerCheckbox(param1:CheckBox) : void
        {
            var _loc_2:* = this._1103317861followOwnerCheckbox;
            if (_loc_2 !== param1)
            {
                this._1103317861followOwnerCheckbox = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "followOwnerCheckbox", _loc_2, param1));
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

        public function get hostComponent() : TwitterLoginSuccessScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TwitterLoginSuccessScreen) : void
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
