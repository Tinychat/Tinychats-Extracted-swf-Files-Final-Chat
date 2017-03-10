package com.tinychat.ui.mediators.login
{
    import com.tinychat.controller.commands.login.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.social.network.*;
    import com.tinychat.ui.components.login.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class SocialNetworkLoginScreenMediator extends SequencedScreenMediator
    {
        public var loginSuccess:LoginSuccess;
        public var loginFailure:LoginFailure;
        public var loginRequest:LoginRequest;
        protected var view:LoadingScreenBase;
        private var loginProxy:SocialNetworkProxy;
        private var loginType:LoginType;

        public function SocialNetworkLoginScreenMediator(param1:LoadingScreenBase, param2:SocialNetworkProxy, param3:LoginType)
        {
            this.view = param1;
            this.loginProxy = param2;
            this.loginType = param3;
            return;
        }// end function

        override public function onRegister() : void
        {
            if (!this.loginProxy.isLoggingIn)
            {
            }
            if (this.loginProxy.isLoggedIn)
            {
                dispatchGoNext();
            }
            this.view.confirmLabel = "Try again";
            this.view.cancelLabel = "Cancel";
            this.view.isLoading = true;
            this.loginSuccess.add(this.loginSuccessHandler);
            this.loginFailure.add(this.loginFailureHandler);
            this.view.canceled.add(this.canceledHandler);
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.loginSuccess.remove(this.loginSuccessHandler);
            this.loginFailure.remove(this.loginFailureHandler);
            this.view.canceled.remove(this.canceledHandler);
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function loginSuccessHandler(param1:UserIdentity) : void
        {
            dispatchGoNext();
            return;
        }// end function

        private function loginFailureHandler(param1:String) : void
        {
            this.view.isLoading = false;
            return;
        }// end function

        private function confirmedHandler() : void
        {
            this.view.isLoading = true;
            this.loginRequest.dispatch(this.loginType);
            return;
        }// end function

        private function canceledHandler() : void
        {
            dispatchGoPrevious();
            return;
        }// end function

    }
}
