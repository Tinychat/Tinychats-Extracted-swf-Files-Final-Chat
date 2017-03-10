package com.tinychat.model.menuoption
{
    import __AS3__.vec.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class AbstractSocialNetworkUserMenuOption extends AbstractMenuOption
    {

        public function AbstractSocialNetworkUserMenuOption(param1:String, param2:IsntCurrentSocialNetworkUser, param3:Vector.<IdentityValidation> = null)
        {
            if (param3)
            {
                param3.push(param2);
            }
            else
            {
                param3 = this.Vector.<IdentityValidation>([param2]);
            }
            super(param1, param3);
            return;
        }// end function

    }
}
