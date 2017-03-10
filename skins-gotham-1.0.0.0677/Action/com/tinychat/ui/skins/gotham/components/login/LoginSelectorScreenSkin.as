package com.tinychat.ui.skins.gotham.components.login
{
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.components.spark.*;
    import flashx.textLayout.elements.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class LoginSelectorScreenSkin extends Skin implements IStateClient2
    {
        public var _LoginSelectorScreenSkin_VGroup1:VGroup;
        private var _799554181guestHeader:Label;
        private var _1465299565nicknameSelector:NicknameSelector;
        private var _1748459547socialLoginButtons:SocialLoginButtons;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:LoginSelectorScreen;

        public function LoginSelectorScreenSkin()
        {
            mx_internal::_document = this;
            this.maxWidth = 510;
            this.layout = this._LoginSelectorScreenSkin_VerticalLayout1_c();
            this.mxmlContent = [this._LoginSelectorScreenSkin_TitleDisplay1_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._LoginSelectorScreenSkin_VGroup1_i);
            states = [new State({name:"normal", overrides:[]}), new State({name:"showGuestLogin", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["titleDisplay"]})]})];
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

        private function _LoginSelectorScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 20;
            _loc_1.horizontalAlign = "justify";
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.layout = this._LoginSelectorScreenSkin_VerticalLayout2_c();
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._LoginSelectorScreenSkin_Array3_c);
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_VerticalLayout2_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 20;
            _loc_1.horizontalAlign = "center";
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_Array3_c() : Array
        {
            var _loc_1:Array = [this._LoginSelectorScreenSkin_SocialLoginButtons1_i(), this._LoginSelectorScreenSkin_RichEditableText1_c()];
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_SocialLoginButtons1_i() : SocialLoginButtons
        {
            var _loc_1:* = new SocialLoginButtons();
            _loc_1.percentWidth = 100;
            _loc_1.id = "socialLoginButtons";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.socialLoginButtons = _loc_1;
            BindingManager.executeBindings(this, "socialLoginButtons", this.socialLoginButtons);
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_RichEditableText1_c() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.editable = false;
            _loc_1.selectable = false;
            _loc_1.focusEnabled = false;
            _loc_1.textFlow = this._LoginSelectorScreenSkin_TextFlow1_c();
            _loc_1.setStyle("fontSize", 10);
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_TextFlow1_c() : TextFlow
        {
            var _loc_1:* = new TextFlow();
            _loc_1.mxmlChildren = ["\n                    ", this._LoginSelectorScreenSkin_ParagraphElement1_c(), "\n                "];
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_ParagraphElement1_c() : ParagraphElement
        {
            var _loc_1:* = new ParagraphElement();
            _loc_1.mxmlChildren = ["\n                        By joining this chat, you must be 18 or older and agree to our\n                        ", this._LoginSelectorScreenSkin_LinkElement1_c(), ".\n                    "];
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_LinkElement1_c() : LinkElement
        {
            var _loc_1:* = new LinkElement();
            _loc_1.href = "https://tinychat.com/terms.html";
            _loc_1.target = "_blank";
            _loc_1.mxmlChildren = ["Terms of Service"];
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.gap = 20;
            _loc_1.paddingLeft = 20;
            _loc_1.paddingRight = 20;
            _loc_1.paddingBottom = 20;
            _loc_1.horizontalAlign = "justify";
            _loc_1.mxmlContent = [this._LoginSelectorScreenSkin_Label1_i(), this._LoginSelectorScreenSkin_NicknameSelector1_i()];
            _loc_1.id = "_LoginSelectorScreenSkin_VGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._LoginSelectorScreenSkin_VGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_LoginSelectorScreenSkin_VGroup1", this._LoginSelectorScreenSkin_VGroup1);
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "guestHeader";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.guestHeader = _loc_1;
            BindingManager.executeBindings(this, "guestHeader", this.guestHeader);
            return _loc_1;
        }// end function

        private function _LoginSelectorScreenSkin_NicknameSelector1_i() : NicknameSelector
        {
            var _loc_1:* = new NicknameSelector();
            _loc_1.id = "nicknameSelector";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nicknameSelector = _loc_1;
            BindingManager.executeBindings(this, "nicknameSelector", this.nicknameSelector);
            return _loc_1;
        }// end function

        public function get guestHeader() : Label
        {
            return this._799554181guestHeader;
        }// end function

        public function set guestHeader(param1:Label) : void
        {
            var _loc_2:* = this._799554181guestHeader;
            if (_loc_2 !== param1)
            {
                this._799554181guestHeader = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guestHeader", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get nicknameSelector() : NicknameSelector
        {
            return this._1465299565nicknameSelector;
        }// end function

        public function set nicknameSelector(param1:NicknameSelector) : void
        {
            var _loc_2:* = this._1465299565nicknameSelector;
            if (_loc_2 !== param1)
            {
                this._1465299565nicknameSelector = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nicknameSelector", _loc_2, param1));
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

        public function get hostComponent() : LoginSelectorScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:LoginSelectorScreen) : void
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
