package com.tinychat.model.menuoption
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.guards.mode.*;
    import com.tinychat.model.validation.user.*;

    public class SocialNetworkInviteUserMenuOption extends AbstractSocialNetworkUserMenuOption
    {
        private var isntNextMode:IsntNextModeGuard;

        public function SocialNetworkInviteUserMenuOption(param1:IsntCurrentSocialNetworkUser, param2:IsntNextModeGuard)
        {
            this.isntNextMode = param2;
            super("Invite", param1);
            return;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            if (super.isValid(param1))
            {
                super.isValid(param1);
            }
            return this.isntNextMode.approve();
        }// end function

    }
}
