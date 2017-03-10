package com.tinychat.ui.mediators.invite
{
    import com.tinychat.controller.commands.invite.twitter.signals.*;
    import com.tinychat.controller.commands.login.signals.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.social.network.twitter.*;
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class InviteSelectionScreenMediatorBase extends SequencedScreenMediator
    {
        public var roomInfo:RoomSettingsProxy;
        public var loginRequest:LoginRequest;
        public var twitterProxy:TwitterProxy;
        public var tweetInvite:TwitterWebIntentTweetInvite;
        private var view:InviteSelectionScreen;

        public function InviteSelectionScreenMediatorBase(param1:InviteSelectionScreen)
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.roomUrlField.url = this.roomInfo.url;
            this.view.roomUrlField.copyLabel = "Copy";
            this.view.socialLoginButtonClicked.add(this.socialLoginButtonClicked);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.socialLoginButtonClicked.remove(this.socialLoginButtonClicked);
            return;
        }// end function

        private function socialLoginButtonClicked(param1:LoginType) : void
        {
            if (param1 == LoginType.TWITTER)
            {
            }
            if (this.twitterProxy.isLoggedIn)
            {
                this.tweetInvite.dispatch();
                dispatchComplete();
            }
            else
            {
                dispatchGoNext(param1);
                this.loginRequest.dispatch(param1, false);
            }
            return;
        }// end function

    }
}
