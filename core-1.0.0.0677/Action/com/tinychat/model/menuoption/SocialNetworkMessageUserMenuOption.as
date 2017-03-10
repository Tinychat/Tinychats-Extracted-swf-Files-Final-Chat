package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.user.*;

    public class SocialNetworkMessageUserMenuOption extends AbstractSocialNetworkUserMenuOption
    {

        public function SocialNetworkMessageUserMenuOption(param1:IsntCurrentSocialNetworkUser)
        {
            super("Private message", param1);
            return;
        }// end function

    }
}
