package com.tinychat.ui.mediators.login
{
    import com.tinychat.controller.commands.login.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.guards.mode.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class LoginSelectorScreenMediator extends SequencedScreenMediator
    {
        public var view:LoginSelectorScreen;
        public var settings:RoomSettingsProxy;
        public var flashCookieProxy:FlashCookieProxy;
        public var flashvarsProxy:FlashvarsProxy;
        public var loginRequest:LoginRequest;
        public var loginSuccess:LoginSuccess;
        public var isNextMode:IsNextModeGuard;

        public function LoginSelectorScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.restriction = this.settings.roomLoginRestriction;
            if (this.isNextMode.approve())
            {
                this.view.singleLoginTitle = "To join roulette, please click the button below to authenticate yourself:";
                this.view.multiLoginTitle = "To join roulette, please click one of the buttons below to authenticate yourself:";
            }
            else
            {
                this.view.singleLoginTitle = "To join this chatroom, please click the button below to authenticate yourself:";
                this.view.multiLoginTitle = "To join this chatroom, please click one of the buttons below to authenticate yourself:";
            }
            this.view.tinychatName = this.flashvarsProxy.nick;
            this.view.rememberedName = this.flashCookieProxy.username;
            this.view.guestHeaderLabel = "Enter a username:";
            this.view.socialLoginButtonClicked.add(this.socialLoginButtonClicked);
            this.view.guestNameSubmitted.addOnce(this.guestLoginSubmittedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.socialLoginButtonClicked.remove(this.socialLoginButtonClicked);
            this.view.guestNameSubmitted.remove(this.guestLoginSubmittedHandler);
            this.loginSuccess.remove(this.loginSuccessHandler);
            return;
        }// end function

        private function socialLoginButtonClicked(param1:LoginType) : void
        {
            if (param1 != LoginType.GUEST)
            {
                dispatchGoNext(param1);
                this.loginRequest.dispatch(param1);
            }
            return;
        }// end function

        private function guestLoginSubmittedHandler(param1:String) : void
        {
            this.loginSuccess.addOnce(this.loginSuccessHandler);
            this.loginRequest.dispatch(LoginType.GUEST, true, {name:param1});
            return;
        }// end function

        private function loginSuccessHandler(param1:UserIdentity) : void
        {
            dispatchGoNext();
            return;
        }// end function

    }
}
