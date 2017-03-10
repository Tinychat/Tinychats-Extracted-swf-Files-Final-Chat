package com.tinychat.model.menuoption
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.business.*;
    import com.tinychat.model.validation.*;

    public class UpgradeUserMenuOption extends AbstractMenuOption
    {
        private var userGuard:IsPaidUserGuard;

        public function UpgradeUserMenuOption(param1:IsARoomUser, param2:IsPaidUserGuard)
        {
            this.userGuard = param2;
            super("Upgrade", this.Vector.<IdentityValidation>([param1]));
            return;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            if (super.isValid(param1))
            {
                super.isValid(param1);
            }
            return Roles.inLessRoleThan(this.userGuard.getRole, Roles.GOLD);
        }// end function

    }
}
