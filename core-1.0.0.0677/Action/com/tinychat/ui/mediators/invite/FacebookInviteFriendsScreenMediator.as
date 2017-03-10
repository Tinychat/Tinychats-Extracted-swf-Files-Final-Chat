package com.tinychat.ui.mediators.invite
{
    import com.tinychat.controller.commands.popup.signals.*;
    import com.tinychat.controller.commands.social.network.facebook.signals.*;
    import com.tinychat.model.invite.facebook.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class FacebookInviteFriendsScreenMediator extends SequencedScreenMediator
    {
        public var view:FacebookInviteFriendsScreen;
        public var facebookProxy:FacebookLoginProxy;
        public var facebookFriendsProxy:FacebookFriendsProxy;
        public var chatInviter:FacebookChatInviteSender;
        public var closeableModalPopup:CloseableModalPopup;
        public var postFacebookInviteStatus:PostFacebookInviteStatus;
        public var promptFacebookInviteStatus:PromptFacebookInviteStatus;
        private var currentUser:FacebookUser;

        public function FacebookInviteFriendsScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.closeableModalPopup.dispatch(false);
            this.currentUser = this.facebookProxy.facebookUser;
            this.view.currentUser = new FacebookUserListItem(this.currentUser);
            this.view.dataProvider = this.facebookFriendsProxy.list;
            this.view.title = "Invite your Facebook friends";
            this.view.statusLabelText = "Loading available friends";
            this.view.searchFriendsFieldPromptText = "Search for a friend...";
            this.view.selectedFriendsCountLabelText = "{0} friends selected";
            this.view.allFriendsLabelText = "{0} of your friends are online in Tinychat.";
            this.view.noFriendsFoundLabelText = "We weren\'t able to find any of your Facebook friends at the moment.";
            this.view.presenceSearchLabelText = "{0} of your Facebook friends are online.";
            this.view.nameSearchLabelText = "{0} Facebook friends match \"{1}\".";
            this.view.updateStatusCheckboxLabelText = "Update status";
            this.view.confirmLabel = "Join room";
            this.view.sendInvitesLabelText = "Send invites";
            this.view.setSelectBatchLabelText("Select all", "Deselect all");
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            if (this.view.updateStatus)
            {
                this.postFacebookInviteStatus.dispatch(this.view.inviteMessageInputText);
            }
            else if (this.view.promptStatus)
            {
                this.promptFacebookInviteStatus.dispatch();
            }
            if (this.view.selected.length > 0)
            {
                this.chatInviter.send(this.view.inviteMessageInputText, this.view.selected);
            }
            dispatchGoNext();
            return;
        }// end function

    }
}
