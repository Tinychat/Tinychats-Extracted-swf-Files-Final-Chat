package com.tinychat.ui.components.invite
{
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.components.spark.*;
    import flash.display.*;
    import flash.events.*;
    import mx.utils.*;
    import spark.events.*;

    public class FacebookInviteFriendScreen extends TitleWindowElementBase
    {
        public var userPicture:ImageSourceDisplay;
        public var input:InviteMessageInput;
        private var _invitee:FacebookUserListItem;
        private var userPictureChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, userPicture:true, input:true, loadingIndicator:false, titleDisplay:false, statusLabel:false};

        public function FacebookInviteFriendScreen()
        {
            return;
        }// end function

        public function set invitee(param1:FacebookUserListItem) : void
        {
            if (this._invitee != param1)
            {
                this._invitee = param1;
                this.title = super.title;
                this.userPictureChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get inviteMessageInputText() : String
        {
            return this.input ? (this.input.text) : ("");
        }// end function

        override public function set title(param1:String) : void
        {
            if (this._invitee)
            {
                param1 = StringUtil.substitute(param1, this._invitee.name);
            }
            super.title = param1;
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.userPictureChanged)
            {
            }
            if (this.userPicture)
            {
                if (this._invitee.isPictureLoaded)
                {
                    this.userPicture.source = this._invitee.picture;
                }
                else
                {
                    this._invitee.pictureLoaded.addOnce(this.pictureLoadedHandler);
                    this._invitee.loadPicture();
                }
                this.userPictureChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.input)
            {
                this.input.addEventListener(Event.CHANGE, this.inputChangeHandler);
            }
            else if (param2 == confirm)
            {
                this.updateConfirmState();
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.input)
            {
                this.input.removeEventListener(Event.CHANGE, this.inputChangeHandler);
            }
            return;
        }// end function

        override protected function confirmClickHandler(event:MouseEvent) : void
        {
            if (this.input.isValid)
            {
                super.confirmClickHandler(event);
            }
            return;
        }// end function

        private function updateConfirmState() : void
        {
            if (confirm)
            {
                if (this.input)
                {
                }
                confirm.enabled = this.input.isValid;
            }
            return;
        }// end function

        private function inputChangeHandler(event:TextOperationEvent) : void
        {
            this.updateConfirmState();
            return;
        }// end function

        private function pictureLoadedHandler(param1:DisplayObject) : void
        {
            this.userPicture.source = param1;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
