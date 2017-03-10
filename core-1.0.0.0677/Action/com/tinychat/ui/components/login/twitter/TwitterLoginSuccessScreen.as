package com.tinychat.ui.components.login.twitter
{
    import com.tinychat.ui.components.login.*;
    import spark.components.*;

    public class TwitterLoginSuccessScreen extends LoginSuccessScreenBase
    {
        public var followOwnerCheckbox:CheckBox;
        public var followUsCheckbox:CheckBox;
        private var _followUsCheckboxLabelText:String;
        private var _followOwnerCheckboxLabelText:String;
        private var _twitterOwner:String;
        private var followUsCheckboxLabelTextChanged:Boolean;
        private var followOwnerCheckboxLabelTextChanged:Boolean;
        private var twitterOwnerChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, userPicture:false, followOwnerCheckbox:true, followUsCheckbox:true, loadingIndicator:false, titleDisplay:false, updateStatusCheckbox:false, statusLabel:false};

        public function TwitterLoginSuccessScreen()
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

        public function get followOwner() : Boolean
        {
            if (this.followOwnerCheckbox)
            {
            }
            if (this.followOwnerCheckbox.visible)
            {
            }
            return this.followOwnerCheckbox.selected;
        }// end function

        public function set followOwnerCheckboxLabelText(param1:String) : void
        {
            if (this._followOwnerCheckboxLabelText != param1)
            {
                this._followOwnerCheckboxLabelText = param1;
                this.followOwnerCheckboxLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get twitterOwner() : String
        {
            return this._twitterOwner;
        }// end function

        public function set twitterOwner(param1:String) : void
        {
            if (this._twitterOwner != param1)
            {
                this._twitterOwner = param1;
                this.twitterOwnerChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:Boolean = false;
            super.commitProperties();
            if (this.followUsCheckboxLabelTextChanged)
            {
            }
            if (this.followUsCheckbox)
            {
                this.followUsCheckbox.label = this._followUsCheckboxLabelText;
                this.followUsCheckboxLabelTextChanged = false;
            }
            if (this.followOwnerCheckboxLabelTextChanged)
            {
            }
            if (this.followOwnerCheckbox)
            {
                this.followOwnerCheckbox.label = this._followOwnerCheckboxLabelText;
                this.followOwnerCheckboxLabelTextChanged = false;
            }
            if (this.twitterOwnerChanged)
            {
            }
            if (this.followOwnerCheckbox)
            {
                _loc_1 = this.twitterOwner != "";
                this.followOwnerCheckbox.visible = _loc_1;
                this.followOwnerCheckbox.includeInLayout = _loc_1;
                this.twitterOwnerChanged = false;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
