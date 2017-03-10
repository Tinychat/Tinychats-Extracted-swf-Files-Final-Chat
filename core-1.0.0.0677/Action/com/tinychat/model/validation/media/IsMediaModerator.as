package com.tinychat.model.validation.media
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.validation.user.*;

    public class IsMediaModerator extends Object implements IdentityValidation
    {
        private var isOperator:IsOperator;
        private var flashvars:FlashvarsProxy;

        public function IsMediaModerator(param1:IsOperator, param2:FlashvarsProxy)
        {
            this.isOperator = param1;
            this.flashvars = param2;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            if (this.flashvars.youtube != MediaRestriction.ALL)
            {
                if (this.flashvars.youtube == MediaRestriction.OPERATORS)
                {
                }
            }
            return this.isOperator.isValid(param1);
        }// end function

    }
}
