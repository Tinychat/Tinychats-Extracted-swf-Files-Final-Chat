package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class UnignoreUserMenuOption extends AbstractMenuOption
    {

        public function UnignoreUserMenuOption(param1:IsntCurrentUser, param2:IsIgnored)
        {
            super("Unignore", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
