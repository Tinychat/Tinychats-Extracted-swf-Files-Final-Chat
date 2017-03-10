package com.tinychat.ui.skins.gotham.components.login.tumblr
{
    import com.tinychat.ui.components.login.tumblr.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class TumblrLoginSuccessScreenSkin extends Skin
    {
        private var _951117504confirm:Button;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_tumblr_logo_png_1505136424:Class;
        private var _213507019hostComponent:TumblrLoginSuccessScreen;

        public function TumblrLoginSuccessScreenSkin()
        {
            this._embed_mxml__images_tumblr_logo_png_1505136424 = TumblrLoginSuccessScreenSkin__embed_mxml__images_tumblr_logo_png_1505136424;
            mx_internal::_document = this;
            this.width = 510;
            this.layout = this._TumblrLoginSuccessScreenSkin_VerticalLayout1_c();
            this.mxmlContent = [this._TumblrLoginSuccessScreenSkin_TitleDisplay1_i(), this._TumblrLoginSuccessScreenSkin_VGroup1_c()];
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

        private function _TumblrLoginSuccessScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.horizontalAlign = "center";
            _loc_1.gap = 20;
            _loc_1.paddingBottom = 15;
            return _loc_1;
        }// end function

        private function _TumblrLoginSuccessScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.percentWidth = 100;
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

        private function _TumblrLoginSuccessScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.gap = 20;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._TumblrLoginSuccessScreenSkin_BitmapImage1_c(), this._TumblrLoginSuccessScreenSkin_Button1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TumblrLoginSuccessScreenSkin_BitmapImage1_c() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.source = this._embed_mxml__images_tumblr_logo_png_1505136424;
            _loc_1.width = 60;
            _loc_1.height = 60;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TumblrLoginSuccessScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 150;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
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

        public function get hostComponent() : TumblrLoginSuccessScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TumblrLoginSuccessScreen) : void
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
