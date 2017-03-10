package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class FollowUserMenuOption extends AbstractMenuOption
    {

        public function FollowUserMenuOption(param1:IsARoomUser, param2:IsntCurrentUser, param3:IsLoggedIn)
        {
            super("Follow", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
