package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class IgnoreUserMenuOption extends AbstractMenuOption
    {

        public function IgnoreUserMenuOption(param1:IsARoomUser, param2:IsntCurrentUser, param3:IsntIgnored)
        {
            super("Ignore", this.Vector.<IdentityValidation>([param1, param2, param3]));
            return;
        }// end function

    }
}
