package com.tinychat.ui.skins.gotham.components.invite
{
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.url.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class InviteSelectionScreenSkin extends Skin
    {
        private var _773729594roomUrlField:UrlDisplay;
        private var _1837623873roomUrlHeader:Label;
        private var _1748459547socialLoginButtons:SocialLoginButtons;
        private var _183974977socialNetworksHeader:Label;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:InviteSelectionScreen;

        public function InviteSelectionScreenSkin()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.mxmlContent = [this._InviteSelectionScreenSkin_TitleDisplay1_i(), this._InviteSelectionScreenSkin_VGroup1_c()];
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

        private function _InviteSelectionScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 50;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _InviteSelectionScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 20;
            _loc_1.right = 20;
            _loc_1.top = 70;
            _loc_1.bottom = 20;
            _loc_1.gap = 20;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._InviteSelectionScreenSkin_Label1_i(), this._InviteSelectionScreenSkin_UrlDisplay1_i(), this._InviteSelectionScreenSkin_Label2_i(), this._InviteSelectionScreenSkin_SocialLoginButtons1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _InviteSelectionScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.id = "roomUrlHeader";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.roomUrlHeader = _loc_1;
            BindingManager.executeBindings(this, "roomUrlHeader", this.roomUrlHeader);
            return _loc_1;
        }// end function

        private function _InviteSelectionScreenSkin_UrlDisplay1_i() : UrlDisplay
        {
            var _loc_1:* = new UrlDisplay();
            _loc_1.percentWidth = 90;
            _loc_1.height = 40;
            _loc_1.styleName = "popup";
            _loc_1.setStyle("skinClass", InviteUrlDisplaySkin);
            _loc_1.id = "roomUrlField";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.roomUrlField = _loc_1;
            BindingManager.executeBindings(this, "roomUrlField", this.roomUrlField);
            return _loc_1;
        }// end function

        private function _InviteSelectionScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.id = "socialNetworksHeader";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.socialNetworksHeader = _loc_1;
            BindingManager.executeBindings(this, "socialNetworksHeader", this.socialNetworksHeader);
            return _loc_1;
        }// end function

        private function _InviteSelectionScreenSkin_SocialLoginButtons1_i() : SocialLoginButtons
        {
            var _loc_1:* = new SocialLoginButtons();
            _loc_1.id = "socialLoginButtons";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.socialLoginButtons = _loc_1;
            BindingManager.executeBindings(this, "socialLoginButtons", this.socialLoginButtons);
            return _loc_1;
        }// end function

        public function get roomUrlField() : UrlDisplay
        {
            return this._773729594roomUrlField;
        }// end function

        public function set roomUrlField(param1:UrlDisplay) : void
        {
            var _loc_2:* = this._773729594roomUrlField;
            if (_loc_2 !== param1)
            {
                this._773729594roomUrlField = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomUrlField", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get roomUrlHeader() : Label
        {
            return this._1837623873roomUrlHeader;
        }// end function

        public function set roomUrlHeader(param1:Label) : void
        {
            var _loc_2:* = this._1837623873roomUrlHeader;
            if (_loc_2 !== param1)
            {
                this._1837623873roomUrlHeader = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomUrlHeader", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get socialLoginButtons() : SocialLoginButtons
        {
            return this._1748459547socialLoginButtons;
        }// end function

        public function set socialLoginButtons(param1:SocialLoginButtons) : void
        {
            var _loc_2:* = this._1748459547socialLoginButtons;
            if (_loc_2 !== param1)
            {
                this._1748459547socialLoginButtons = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "socialLoginButtons", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get socialNetworksHeader() : Label
        {
            return this._183974977socialNetworksHeader;
        }// end function

        public function set socialNetworksHeader(param1:Label) : void
        {
            var _loc_2:* = this._183974977socialNetworksHeader;
            if (_loc_2 !== param1)
            {
                this._183974977socialNetworksHeader = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "socialNetworksHeader", _loc_2, param1));
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

        public function get hostComponent() : InviteSelectionScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:InviteSelectionScreen) : void
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
