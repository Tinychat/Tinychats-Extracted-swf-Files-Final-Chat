package com.tinychat.ui.components.login
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.nick.*;
    import com.tinychat.ui.components.password.*;
    import flash.events.*;
    import spark.events.*;

    public class NicknameSelector extends PasswordPromptScreen
    {
        private var _username:String;
        private var usernameChanged:Boolean;
        private var _occupiedNames:RenameableItemList;
        private var _formatter:NickFormatter;
        private var formatterChanged:Boolean;
        private static var _skinParts:Object = {usernameField:false, confirm:false, cancel:false, loadingIndicator:false, passwordField:false, titleDisplay:false, statusLabel:false};

        public function NicknameSelector()
        {
            return;
        }// end function

        public function set formatter(param1:NickFormatter) : void
        {
            if (this._formatter != param1)
            {
                this._formatter = param1;
                this.formatterChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set username(param1:String) : void
        {
            if (this._username != param1)
            {
                this._username = param1;
                this.usernameChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set occupiedNames(param1:RenameableItemList) : void
        {
            if (this._occupiedNames != param1)
            {
                this._occupiedNames = param1;
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.usernameChanged)
            {
            }
            if (usernameField)
            {
                usernameField.text = this._username;
                this.usernameChanged = false;
            }
            if (this.formatterChanged)
            {
            }
            if (usernameField)
            {
                usernameField.restrict = this._formatter.allowedCharacters;
                this.reformatText();
                this.formatterChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == usernameField)
            {
                usernameField.maxChars = 32;
                usernameField.addEventListener(TextOperationEvent.CHANGE, this.changeHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == usernameField)
            {
                usernameField.removeEventListener(TextOperationEvent.CHANGE, this.changeHandler);
            }
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            this.reformatText();
            return;
        }// end function

        private function reformatText() : void
        {
            usernameField.text = this._formatter.format(usernameField.text);
            return;
        }// end function

        override protected function submit() : void
        {
            var _loc_1:* = usernameField.text;
            if (this._occupiedNames.hasItemWithName(_loc_1))
            {
                statusLabelText = "The name \'" + _loc_1 + "\' is already taken. Please choose another.";
            }
            else
            {
                super.submit();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
