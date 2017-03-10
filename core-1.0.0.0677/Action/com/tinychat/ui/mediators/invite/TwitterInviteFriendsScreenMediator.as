package com.tinychat.ui.mediators.invite
{
    import com.tinychat.controller.commands.social.network.twitter.signals.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.invite.twitter.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.twitter.*;
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.mediators.screensequence.*;
    import flash.display.*;

    public class TwitterInviteFriendsScreenMediator extends SequencedScreenMediator
    {
        public var view:TwitterInviteFriendsScreen;
        public var twitterProxy:TwitterProxy;
        public var flashvars:FlashvarsProxy;
        public var templates:TwitterInviteTemplates;
        public var tweet:TwitterPostTweet;
        public var follow:TwitterFollow;
        private var currentUser:SocialNetworkUserListItem;

        public function TwitterInviteFriendsScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.currentUser = this.twitterProxy.twitterUser;
            this.view.dataProvider = this.twitterProxy.friends;
            if (this.currentUser.isPictureLoaded)
            {
                this.view.userPicture.source = this.currentUser.picture;
            }
            else
            {
                this.currentUser.pictureLoaded.addOnce(this.pictureLoadedHandler);
                this.currentUser.loadPicture();
            }
            this.view.title = "Invite your Twitter friends";
            this.view.searchFriendsFieldPromptText = "Search for a friend...";
            this.view.selectedFriendsCountLabelText = "{0} friends selected";
            this.view.allFriendsLabelText = "You have {0} Twitter friends suggested. Select friends to invite via direct message.";
            this.view.noFriendsFoundLabelText = "We weren\'t able to find any of your Twitter friends at the moment.";
            this.view.nameSearchLabelText = "{0} Twitter friends match \"{1}\".";
            this.view.updateStatusCheckboxLabelText = "Update status";
            this.view.followUsCheckboxLabelText = "Follow @tinychat";
            this.updateConfirmLabel();
            this.view.selectionChange.add(this.selectionChangeHandler);
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.currentUser.pictureLoaded.remove(this.pictureLoadedHandler);
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function pictureLoadedHandler(param1:DisplayObject) : void
        {
            this.view.userPicture.source = param1;
            this.currentUser.pictureLoaded.remove(this.pictureLoadedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            if (this.view.updateStatus)
            {
                this.tweet.dispatch(this.templates.generate());
            }
            this.follow.dispatch(this.view.followUs);
            dispatchGoNext();
            return;
        }// end function

        private function selectionChangeHandler(param1:SocialNetworkUserListItem) : void
        {
            this.updateConfirmLabel();
            return;
        }// end function

        private function updateConfirmLabel() : void
        {
            if (this.view.selected.length == 0)
            {
                this.view.confirmLabel = "Ok";
            }
            else
            {
                this.view.confirmLabel = "Tell \'em";
            }
            return;
        }// end function

    }
}
