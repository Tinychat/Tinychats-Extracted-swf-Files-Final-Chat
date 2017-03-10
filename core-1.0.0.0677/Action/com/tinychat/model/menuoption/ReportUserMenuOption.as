package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class ReportUserMenuOption extends AbstractMenuOption
    {

        public function ReportUserMenuOption(param1:IsARoomUser, param2:IsntCurrentUser)
        {
            super("Report", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
