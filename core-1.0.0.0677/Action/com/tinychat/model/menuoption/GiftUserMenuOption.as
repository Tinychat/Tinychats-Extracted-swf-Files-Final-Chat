package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class GiftUserMenuOption extends AbstractMenuOption
    {

        public function GiftUserMenuOption(param1:IsARoomUser, param2:IsntCurrentUser)
        {
            super("Send Virtual Gift", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
