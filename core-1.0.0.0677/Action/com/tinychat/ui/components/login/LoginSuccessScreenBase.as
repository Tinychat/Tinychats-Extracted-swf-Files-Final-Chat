package com.tinychat.ui.components.login
{
    import com.tinychat.ui.components.spark.*;
    import spark.components.*;
    import spark.primitives.*;

    public class LoginSuccessScreenBase extends TitleWindowElementBase
    {
        public var userPicture:BitmapImage;
        public var updateStatusCheckbox:CheckBox;
        private var _updateStatusCheckboxLabelText:String;
        private var updateStatusCheckboxLabelTextChanged:Boolean;
        private var _userPictureSource:Object;
        private var userPictureSourceChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, userPicture:false, loadingIndicator:false, titleDisplay:false, updateStatusCheckbox:false, statusLabel:false};

        public function LoginSuccessScreenBase()
        {
            return;
        }// end function

        public function get updateStatus() : Boolean
        {
            if (this.updateStatusCheckbox)
            {
            }
            return this.updateStatusCheckbox.selected;
        }// end function

        public function set updateStatusCheckboxLabelText(param1:String) : void
        {
            if (this._updateStatusCheckboxLabelText != param1)
            {
                this._updateStatusCheckboxLabelText = param1;
                this.updateStatusCheckboxLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set userPictureSource(param1:Object) : void
        {
            if (this._userPictureSource != param1)
            {
                this._userPictureSource = param1;
                this.userPictureSourceChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.updateStatusCheckboxLabelTextChanged)
            {
            }
            if (this.updateStatusCheckbox)
            {
                this.updateStatusCheckbox.label = this._updateStatusCheckboxLabelText;
                this.updateStatusCheckboxLabelTextChanged = false;
            }
            if (this.userPictureSourceChanged)
            {
            }
            if (this.userPicture)
            {
                this.userPicture.source = this._userPictureSource;
                this.userPictureSourceChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 is CheckBox)
            {
                CheckBox(param2).selected = true;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
