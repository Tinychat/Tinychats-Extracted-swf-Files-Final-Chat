package com.tinychat.ui.components.invite
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.url.*;
    import org.osflash.signals.*;
    import spark.components.supportClasses.*;

    public class InviteSelectionScreen extends TitleWindowElementBase
    {
        public var roomUrlHeader:TextBase;
        public var roomUrlField:UrlDisplay;
        public var socialNetworksHeader:TextBase;
        public var socialLoginButtons:SocialLoginButtons;
        private var _roomUrlHeaderText:String;
        private var _socialNetworksHeaderText:String;
        private var roomUrlHeaderTextChanged:Boolean;
        private var socialNetworksHeaderTextChanged:Boolean;
        private var _socialLoginsButtonsClicked:Signal;
        private static var _skinParts:Object = {confirm:false, cancel:false, roomUrlHeader:false, roomUrlField:false, socialNetworksHeader:false, loadingIndicator:false, titleDisplay:false, socialLoginButtons:false, statusLabel:false};

        public function InviteSelectionScreen()
        {
            this._socialLoginsButtonsClicked = new Signal(LoginType);
            return;
        }// end function

        public function set roomUrlHeaderText(param1:String) : void
        {
            if (this._roomUrlHeaderText != param1)
            {
                this._roomUrlHeaderText = param1;
                this.roomUrlHeaderTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set socialNetworksHeaderText(param1:String) : void
        {
            if (this._socialNetworksHeaderText != param1)
            {
                this._socialNetworksHeaderText = param1;
                this.socialNetworksHeaderTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get socialLoginButtonClicked() : ISignal
        {
            return this._socialLoginsButtonsClicked;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.roomUrlHeaderTextChanged)
            {
            }
            if (this.roomUrlHeader)
            {
                this.roomUrlHeader.text = this._roomUrlHeaderText;
                this.roomUrlHeaderTextChanged = true;
            }
            if (this.socialNetworksHeaderTextChanged)
            {
            }
            if (this.socialNetworksHeader)
            {
                this.socialNetworksHeader.text = this._socialNetworksHeaderText;
                this.socialNetworksHeaderTextChanged = true;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.socialLoginButtons)
            {
                this.socialLoginButtons.loginRestriction = RoomLoginRestriction.FACEBOOK_AND_TWITTER;
                this.socialLoginButtons.clicked.add(this.socialLoginButtonsClickedHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.socialLoginButtons)
            {
                this.socialLoginButtons.clicked.remove(this.socialLoginButtonsClickedHandler);
            }
            return;
        }// end function

        private function socialLoginButtonsClickedHandler(param1:LoginType) : void
        {
            this._socialLoginsButtonsClicked.dispatch(param1);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
