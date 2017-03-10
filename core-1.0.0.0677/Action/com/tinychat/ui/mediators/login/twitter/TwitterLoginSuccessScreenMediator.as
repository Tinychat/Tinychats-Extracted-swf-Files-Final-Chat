package com.tinychat.ui.mediators.login.twitter
{
    import com.tinychat.controller.commands.social.network.facebook.signals.*;
    import com.tinychat.controller.commands.social.network.twitter.signals.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.invite.twitter.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.twitter.*;
    import com.tinychat.ui.components.login.twitter.*;
    import com.tinychat.ui.mediators.screensequence.*;
    import flash.display.*;

    public class TwitterLoginSuccessScreenMediator extends SequencedScreenMediator
    {
        public var view:TwitterLoginSuccessScreen;
        public var flashvars:FlashvarsProxy;
        public var templates:TwitterInviteTemplates;
        public var tweet:TwitterPostTweet;
        public var follow:TwitterFollow;
        public var twitterProxy:TwitterProxy;
        public var promptFacebookInviteStatus:PromptFacebookInviteStatus;
        private var currentUser:SocialNetworkUserListItem;

        public function TwitterLoginSuccessScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.currentUser = this.twitterProxy.twitterUser;
            if (this.currentUser.isPictureLoaded)
            {
                this.view.userPicture.source = this.currentUser.picture;
            }
            else
            {
                this.currentUser.pictureLoaded.addOnce(this.pictureLoadedHandler);
                this.currentUser.loadPicture();
            }
            this.view.title = "Log-in successful!";
            this.view.followUsCheckboxLabelText = "Follow @tinychat";
            this.view.updateStatusCheckboxLabelText = "Update status";
            this.view.confirmLabel = "Continue";
            this.view.followOwnerCheckboxLabelText = "Follow @" + this.flashvars.twitterOwner;
            this.view.twitterOwner = this.flashvars.twitterOwner;
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            if (this.view.updateStatus)
            {
                this.tweet.dispatch(this.templates.generate());
            }
            if (!this.view.followUs)
            {
            }
            if (this.view.followOwner)
            {
                this.follow.dispatch(this.view.followUs, this.view.followOwner ? (this.view.twitterOwner) : (""));
            }
            this.promptFacebookInviteStatus.dispatch();
            dispatchGoNext();
            return;
        }// end function

        private function pictureLoadedHandler(param1:DisplayObject) : void
        {
            this.view.userPictureSource = param1;
            this.currentUser.pictureLoaded.remove(this.pictureLoadedHandler);
            return;
        }// end function

    }
}
