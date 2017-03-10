package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class ProfileUserMenuOption extends AbstractMenuOption
    {

        public function ProfileUserMenuOption(param1:IsARoomUser, param2:IsntCurrentUser)
        {
            super("Profile", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
