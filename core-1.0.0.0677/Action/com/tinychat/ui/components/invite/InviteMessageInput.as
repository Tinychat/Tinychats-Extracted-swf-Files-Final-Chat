package com.tinychat.ui.components.invite
{
    import com.tinychat.ui.components.spark.*;
    import mx.validators.*;

    public class InviteMessageInput extends AdvancedTextInput
    {
        private var validator:StringValidator;
        private static var _skinParts:Object = {promptDisplay2:false, textDisplay:false, promptDisplay:false};

        public function InviteMessageInput()
        {
            return;
        }// end function

        public function get isValid() : Boolean
        {
            if (this.validator)
            {
            }
            return this.validator.validate().results == null;
        }// end function

        override protected function updatePromptMessage() : void
        {
            super.updatePromptMessage();
            if (!this.validator)
            {
                this.validator = new StringValidator();
                this.validator.source = this;
                this.validator.required = true;
                this.validator.property = "text";
            }
            this.validator.requiredFieldError = promptMessage;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
