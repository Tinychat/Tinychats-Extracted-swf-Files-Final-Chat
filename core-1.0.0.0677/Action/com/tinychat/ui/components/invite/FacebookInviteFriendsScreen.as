package com.tinychat.ui.components.invite
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.facebook.*;
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.components.*;

    public class FacebookInviteFriendsScreen extends InviteFriendsScreenBase
    {
        public var sendInvites:Button;
        private var _sendInvitesLabelText:String;
        private var sendInvitesLabelTextChanged:Boolean;
        private var _sendInvitesClicked:Signal;
        private static const SELECT_ALL_LIMIT:uint = 50;
        private static var _skinParts:Object = {cancel:false, userPicture:true, inviteMessageInput:false, searchFriendsField:false, loadingIndicator:false, titleDisplay:false, friendsFoundLabel:true, statusLabel:false, confirm:false, selectedFriendsCountLabel:true, friendsList:true, batchSelect:false, sendInvites:false, updateStatusCheckbox:false};

        public function FacebookInviteFriendsScreen()
        {
            this._sendInvitesClicked = new Signal();
            super(SELECT_ALL_LIMIT);
            return;
        }// end function

        public function set sendInvitesLabelText(param1:String) : void
        {
            if (this._sendInvitesLabelText != param1)
            {
                this._sendInvitesLabelText = param1;
                this.sendInvitesLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get promptStatus() : Boolean
        {
            if (updateStatusCheckbox)
            {
            }
            return !updateStatusCheckbox.selected;
        }// end function

        public function get sendInvitesClicked() : ISignal
        {
            return this._sendInvitesClicked;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.sendInvitesLabelTextChanged)
            {
            }
            if (this.sendInvites)
            {
                this.sendInvites.label = this._sendInvitesLabelText;
                this.sendInvitesLabelTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.sendInvites)
            {
                this.sendInvites.addEventListener(MouseEvent.CLICK, this.sendInvitesClickHandler);
                this.updateSendInvitesState();
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.sendInvites)
            {
                this.sendInvites.removeEventListener(MouseEvent.CLICK, this.sendInvitesClickHandler);
            }
            return;
        }// end function

        override protected function createUserListItem(param1) : SocialNetworkUserListItem
        {
            return new FacebookUserListItem(param1 as FacebookUser);
        }// end function

        override protected function selectedFriendsCountChangedHandler() : void
        {
            super.selectedFriendsCountChangedHandler();
            if (this.sendInvites)
            {
                this.updateSendInvitesState();
            }
            return;
        }// end function

        override protected function confirmClickHandler(event:MouseEvent) : void
        {
            if (!this.promptForStatusMessage)
            {
                super.confirmClickHandler(event);
            }
            return;
        }// end function

        private function sendInvitesClickHandler(event:MouseEvent) : void
        {
            this._sendInvitesClicked.dispatch();
            deselectAll();
            return;
        }// end function

        private function updateSendInvitesState() : void
        {
            var _loc_1:* = selectedFriendsCount > 0;
            this.sendInvites.visible = _loc_1;
            this.sendInvites.includeInLayout = _loc_1;
            confirm.visible = !_loc_1;
            confirm.includeInLayout = !_loc_1;
            return;
        }// end function

        private function get promptForStatusMessage() : Boolean
        {
            if (selectedFriendsCount > 0)
            {
            }
            if (inviteMessageInput)
            {
            }
            return !inviteMessageInput.isValid;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
