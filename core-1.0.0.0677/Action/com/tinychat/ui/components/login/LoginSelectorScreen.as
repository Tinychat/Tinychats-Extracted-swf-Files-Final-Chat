package com.tinychat.ui.components.login
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.spark.*;
    import org.osflash.signals.*;
    import spark.components.supportClasses.*;

    public class LoginSelectorScreen extends TitleWindowElementBase
    {
        public var socialLoginButtons:SocialLoginButtons;
        public var guestHeader:TextBase;
        public var nicknameSelector:NicknameSelector;
        private var _restriction:RoomLoginRestriction;
        private var _singleLoginTitle:String;
        private var _multiLoginTitle:String;
        private var _guestHeaderLabel:String;
        private var _tinychatName:String;
        private var _rememberedName:String;
        private var restrictionChanged:Boolean;
        private var guestHeaderLabelChanged:Boolean;
        private var tinychatNameChanged:Boolean;
        private var rememberedNameChanged:Boolean;
        private var titleChanged:Boolean;
        private var _guestNameSubmitted:Signal;
        private var _socialLoginsButtonsClicked:Signal;
        private static const STATE_SHOW_GUEST_LOGIN:String = "showGuestLogin";
        private static var _skinParts:Object = {confirm:false, cancel:false, loadingIndicator:false, nicknameSelector:true, titleDisplay:false, socialLoginButtons:true, guestHeader:true, statusLabel:false};

        public function LoginSelectorScreen()
        {
            this._guestNameSubmitted = new Signal(String);
            this._socialLoginsButtonsClicked = new Signal(LoginType);
            return;
        }// end function

        public function get socialLoginButtonClicked() : ISignal
        {
            return this._socialLoginsButtonsClicked;
        }// end function

        public function get guestNameSubmitted() : ISignal
        {
            return this._guestNameSubmitted;
        }// end function

        public function set restriction(param1:RoomLoginRestriction) : void
        {
            if (this._restriction != param1)
            {
                this._restriction = param1;
                this.restrictionChanged = true;
                invalidateSkinState();
                invalidateProperties();
            }
            return;
        }// end function

        public function set singleLoginTitle(param1:String) : void
        {
            if (this._singleLoginTitle != param1)
            {
                this._singleLoginTitle = param1;
                this.updateTitle();
            }
            return;
        }// end function

        public function set multiLoginTitle(param1:String) : void
        {
            if (this._multiLoginTitle != param1)
            {
                this._multiLoginTitle = param1;
                this.updateTitle();
            }
            return;
        }// end function

        public function set guestHeaderLabel(param1:String) : void
        {
            if (this._guestHeaderLabel != param1)
            {
                this._guestHeaderLabel = param1;
                this.guestHeaderLabelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set tinychatName(param1:String) : void
        {
            if (this._tinychatName != param1)
            {
                this._tinychatName = param1;
                this.tinychatNameChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set rememberedName(param1:String) : void
        {
            if (this._rememberedName != param1)
            {
                this._rememberedName = param1;
                this.rememberedNameChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.restrictionChanged)
            {
                this.updateTitle();
                if (this.socialLoginButtons)
                {
                    this.socialLoginButtons.loginRestriction = this._restriction;
                }
                this.restrictionChanged = false;
            }
            if (this.guestHeaderLabelChanged)
            {
            }
            if (this.guestHeader)
            {
                this.guestHeader.text = this._guestHeaderLabel;
                this.guestHeaderLabelChanged = false;
            }
            if (this.tinychatNameChanged)
            {
            }
            if (this.nicknameSelector)
            {
                this.nicknameSelector.username = this._tinychatName;
                this.tinychatNameChanged = false;
            }
            if (this.rememberedNameChanged)
            {
            }
            if (this.nicknameSelector)
            {
                if (!this.hasTinychatName)
                {
                    this.nicknameSelector.username = this._rememberedName;
                }
                this.rememberedNameChanged = false;
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.showGuestLogin)
            {
                return STATE_SHOW_GUEST_LOGIN;
            }
            return super.getCurrentSkinState();
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.nicknameSelector)
            {
                this.nicknameSelector.submitted.add(this.nicknameSelectorSubmittedHandler);
            }
            else if (param2 == this.socialLoginButtons)
            {
                this.socialLoginButtons.clicked.add(this.socialLoginButtonsClickedHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.nicknameSelector)
            {
                this.nicknameSelector.submitted.remove(this.nicknameSelectorSubmittedHandler);
            }
            else if (param2 == this.socialLoginButtons)
            {
                this.socialLoginButtons.clicked.remove(this.socialLoginButtonsClickedHandler);
            }
            return;
        }// end function

        private function updateTitle() : void
        {
            if (this._restriction.isSingleLogin)
            {
                title = this._singleLoginTitle ? (this._singleLoginTitle) : ("");
            }
            else
            {
                title = this._multiLoginTitle ? (this._multiLoginTitle) : ("");
            }
            return;
        }// end function

        private function get hasTinychatName() : Boolean
        {
            if (this._tinychatName)
            {
            }
            return this._tinychatName != "";
        }// end function

        private function get showGuestLogin() : Boolean
        {
            if (this._restriction == RoomLoginRestriction.ANY)
            {
                if (this.socialLoginButtons.selected != LoginType.GUEST)
                {
                }
            }
            return this.hasTinychatName;
        }// end function

        private function socialLoginButtonsClickedHandler(param1:LoginType) : void
        {
            this._socialLoginsButtonsClicked.dispatch(param1);
            invalidateSkinState();
            return;
        }// end function

        private function nicknameSelectorSubmittedHandler(param1:String, param2:String) : void
        {
            this._guestNameSubmitted.dispatch(param1);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
