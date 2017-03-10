package com.tinychat.model.menuoption
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class AbstractOperatorUserMenuOption extends AbstractMenuOption
    {
        private var users:Users;

        public function AbstractOperatorUserMenuOption(param1:String, param2:RoomUsers, param3:Vector.<IdentityValidation> = null)
        {
            super(param1, param3);
            this.users = param2;
            return;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            if (super.isValid(param1))
            {
                super.isValid(param1);
            }
            return this.users.currentUser.operator;
        }// end function

    }
}
