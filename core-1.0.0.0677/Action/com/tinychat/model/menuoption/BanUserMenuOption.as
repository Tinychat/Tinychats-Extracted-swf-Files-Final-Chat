package com.tinychat.model.menuoption
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class BanUserMenuOption extends AbstractOperatorUserMenuOption
    {
        private var isBannableUser:IsBannableUser;

        public function BanUserMenuOption(param1:RoomUsers, param2:IsBannableUser, param3:IsntCurrentUser)
        {
            this.isBannableUser = param2;
            super("Ban", param1, this.Vector.<IdentityValidation>([param3]));
            return;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            if (super.isValid(param1))
            {
                super.isValid(param1);
            }
            return this.isBannableUser.isValid(param1);
        }// end function

    }
}
