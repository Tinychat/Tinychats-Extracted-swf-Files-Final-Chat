package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class TinychatMessageUserMenuOption extends AbstractMenuOption
    {

        public function TinychatMessageUserMenuOption(param1:IsARoomUser, param2:IsntCurrentUser)
        {
            super("Private message", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
