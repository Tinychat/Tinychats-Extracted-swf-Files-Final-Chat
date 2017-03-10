package com.tinychat.ui.skins.gotham.components.login
{
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.components.login.facebook.*;
    import com.tinychat.ui.components.login.twitter.*;
    import com.tinychat.ui.skins.gotham.components.login.guest.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class SocialLoginButtonsSkin extends Skin implements IStateClient2
    {
        private var _595415036_SocialLoginButtonsSkin_HGroup1:HGroup;
        private var _2116091496facebookButton:FacebookButton;
        private var _643137322guestButton:ToggleButton;
        private var _1699882107twitterButton:TwitterButton;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:SocialLoginButtons;

        public function SocialLoginButtonsSkin()
        {
            mx_internal::_document = this;
            this.layout = this._SocialLoginButtonsSkin_VerticalLayout1_c();
            this.mxmlContent = [this._SocialLoginButtonsSkin_HGroup1_i()];
            this.currentState = "any";
            var _loc_1:* = new DeferredInstanceFromFunction(this._SocialLoginButtonsSkin_FacebookButton1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._SocialLoginButtonsSkin_ToggleButton1_i);
            var _loc_3:* = new DeferredInstanceFromFunction(this._SocialLoginButtonsSkin_TwitterButton1_i);
            states = [new State({name:"any", stateGroups:["facebookStates", "tumblrStates", "twitterStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"nonGuest", stateGroups:["facebookStates", "tumblrStates", "twitterStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"facebook", stateGroups:["facebookStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"tumblr", stateGroups:["tumblrStates"], overrides:[]}), new State({name:"twitter", stateGroups:["twitterStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"facebookAndTumblr", stateGroups:["facebookStates", "tumblrStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"facebookAndTwitter", stateGroups:["facebookStates", "twitterStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"tumblrAndTwitter", stateGroups:["tumblrStates", "twitterStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:"_SocialLoginButtonsSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]})];
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

        private function _SocialLoginButtonsSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 20;
            _loc_1.horizontalAlign = "center";
            return _loc_1;
        }// end function

        private function _SocialLoginButtonsSkin_HGroup1_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.gap = 12;
            _loc_1.height = 25;
            _loc_1.horizontalAlign = "center";
            _loc_1.verticalAlign = "justify";
            _loc_1.variableColumnWidth = false;
            _loc_1.columnWidth = 86;
            _loc_1.mxmlContent = [];
            _loc_1.id = "_SocialLoginButtonsSkin_HGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._SocialLoginButtonsSkin_HGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_SocialLoginButtonsSkin_HGroup1", this._SocialLoginButtonsSkin_HGroup1);
            return _loc_1;
        }// end function

        private function _SocialLoginButtonsSkin_FacebookButton1_i() : FacebookButton
        {
            var _loc_1:* = new FacebookButton();
            _loc_1.styleName = "facebookButton";
            _loc_1.id = "facebookButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.facebookButton = _loc_1;
            BindingManager.executeBindings(this, "facebookButton", this.facebookButton);
            return _loc_1;
        }// end function

        private function _SocialLoginButtonsSkin_TwitterButton1_i() : TwitterButton
        {
            var _loc_1:* = new TwitterButton();
            _loc_1.styleName = "twitterButton";
            _loc_1.id = "twitterButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.twitterButton = _loc_1;
            BindingManager.executeBindings(this, "twitterButton", this.twitterButton);
            return _loc_1;
        }// end function

        private function _SocialLoginButtonsSkin_ToggleButton1_i() : ToggleButton
        {
            var _loc_1:* = new ToggleButton();
            _loc_1.setStyle("skinClass", GuestButtonSkin);
            _loc_1.id = "guestButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.guestButton = _loc_1;
            BindingManager.executeBindings(this, "guestButton", this.guestButton);
            return _loc_1;
        }// end function

        public function get _SocialLoginButtonsSkin_HGroup1() : HGroup
        {
            return this._595415036_SocialLoginButtonsSkin_HGroup1;
        }// end function

        public function set _SocialLoginButtonsSkin_HGroup1(param1:HGroup) : void
        {
            var _loc_2:* = this._595415036_SocialLoginButtonsSkin_HGroup1;
            if (_loc_2 !== param1)
            {
                this._595415036_SocialLoginButtonsSkin_HGroup1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_SocialLoginButtonsSkin_HGroup1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get facebookButton() : FacebookButton
        {
            return this._2116091496facebookButton;
        }// end function

        public function set facebookButton(param1:FacebookButton) : void
        {
            var _loc_2:* = this._2116091496facebookButton;
            if (_loc_2 !== param1)
            {
                this._2116091496facebookButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "facebookButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get guestButton() : ToggleButton
        {
            return this._643137322guestButton;
        }// end function

        public function set guestButton(param1:ToggleButton) : void
        {
            var _loc_2:* = this._643137322guestButton;
            if (_loc_2 !== param1)
            {
                this._643137322guestButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guestButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get twitterButton() : TwitterButton
        {
            return this._1699882107twitterButton;
        }// end function

        public function set twitterButton(param1:TwitterButton) : void
        {
            var _loc_2:* = this._1699882107twitterButton;
            if (_loc_2 !== param1)
            {
                this._1699882107twitterButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "twitterButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : SocialLoginButtons
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:SocialLoginButtons) : void
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
