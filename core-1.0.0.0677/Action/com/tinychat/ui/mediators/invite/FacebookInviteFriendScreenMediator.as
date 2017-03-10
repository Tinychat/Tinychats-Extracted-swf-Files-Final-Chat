package com.tinychat.ui.mediators.invite
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.invite.facebook.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.mediators.screen.*;

    public class FacebookInviteFriendScreenMediator extends ScreenMediator
    {
        public var view:FacebookInviteFriendScreen;
        public var user:FacebookUser;
        public var chatInviter:FacebookChatInviteSender;
        public var roomInfo:RoomSettings;

        public function FacebookInviteFriendScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.invitee = new FacebookUserListItem(this.user);
            this.view.title = "Invite {0}";
            this.view.confirmLabel = "Send invite";
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRegister();
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            this.chatInviter.send(this.view.inviteMessageInputText, this.Vector.<RenameableUser>([this.user]));
            complete();
            return;
        }// end function

    }
}
