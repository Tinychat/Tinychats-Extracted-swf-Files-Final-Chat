package com.tinychat.ui.components.invite
{
    import mx.collections.*;
    import spark.components.*;

    public class TwitterInviteFriendsScreen extends InviteFriendsScreenBase
    {
        public var followUsCheckbox:CheckBox;
        private var _followUsCheckboxLabelText:String;
        private var followUsCheckboxLabelTextChanged:Boolean;
        private static var _skinParts:Object = {cancel:false, userPicture:true, inviteMessageInput:false, searchFriendsField:false, loadingIndicator:false, titleDisplay:false, friendsFoundLabel:true, statusLabel:false, confirm:false, selectedFriendsCountLabel:true, friendsList:true, batchSelect:false, followUsCheckbox:true, updateStatusCheckbox:false};

        public function TwitterInviteFriendsScreen()
        {
            return;
        }// end function

        public function get followUs() : Boolean
        {
            if (this.followUsCheckbox)
            {
            }
            return this.followUsCheckbox.selected;
        }// end function

        public function set followUsCheckboxLabelText(param1:String) : void
        {
            if (this._followUsCheckboxLabelText != param1)
            {
                this._followUsCheckboxLabelText = param1;
                this.followUsCheckboxLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.followUsCheckboxLabelTextChanged)
            {
            }
            if (this.followUsCheckbox)
            {
                this.followUsCheckbox.label = this._followUsCheckboxLabelText;
                this.followUsCheckboxLabelTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.followUsCheckbox)
            {
                this.followUsCheckbox.selected = true;
            }
            else if (param2 == inviteMessageInput)
            {
                inviteMessageInput.maxChars = 140;
            }
            return;
        }// end function

        override protected function get sort() : Sort
        {
            var _loc_1:* = new Sort();
            var _loc_2:* = new SortField("fullName", true);
            _loc_1.fields = [_loc_2];
            return _loc_1;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
